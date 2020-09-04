const { v4: uuid } = require("uuid");
const AWS = require("aws-sdk");
const dynamoTabeName = process.env.dynamo_table_name
const expressionBuilder = require("./expressionBuilder")

const documentClient = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context, callback) => {
  console.log("Received event {}", JSON.stringify(event));
  console.log("dynamo table: " +dynamoTabeName)

  switch(event.field) {
    case "get":
      console.log("Getting")
      const result = await documentClient.get({
        TableName: dynamoTabeName,
        Key: {
          id : event.arguments.id
        }
      }).promise()
      console.log(result)
      callback(null, result.Item);
      break;

    case "add":
      console.log("Adding")
      event.arguments.id = uuid()
      await documentClient
        .put({
          TableName: dynamoTabeName,
          Item: event.arguments
        })
        .promise();
      callback(null, event.arguments);
      break;

    case "delete":
      console.log("Deleting")
      await documentClient
        .delete({
          TableName: dynamoTabeName,
          Key: {
            id : event.arguments.id
          }
        })
        .promise();
      callback(null, event.arguments);
      break;

    case "update":
      console.log("Updating")
      console.log(event.arguments)
      const expression = expressionBuilder.create(event.arguments);
      await documentClient
        .update({
          TableName: dynamoTabeName,
          Key: {
            id: event.arguments.id
          },
          UpdateExpression: expression.updateExpression,
          ExpressionAttributeNames: expression.expressionAttributeNames,
          ExpressionAttributeValues:expression.expressionAttributeValues
        })
        .promise();
      callback(null, event.arguments);
      break;

    default:
      callback("Unknown field, unable to resolve" + event.field, null);
      break;
  }
};