const { v4: uuid } = require("uuid");
const AWS = require("aws-sdk");
const dynamoTabeName = process.env.dynamo_table_name

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

    case "update": //TODO generyczny update zalezny od zadeklarowanej schemy
      console.log("Updating")
      await documentClient
        .update({
          TableName: dynamoTabeName,
          Key: {
            id: event.arguments.id
          },
          UpdateExpression: 'set #title = :title, #author = :author, #content = :content, #url= :url',
          ExpressionAttributeNames: {
            '#title': 'title',
            '#content': 'content',
            '#author': 'author',
            '#url':'url'
          },
          ExpressionAttributeValues: {
            ':title': event.arguments.title,
            ':content': event.arguments.content,
            ':author': event.arguments.author,
            ':url':event.arguments.url
          }
        })
        .promise();
      callback(null, event.arguments);
      break;

    default:
      callback("Unknown field, unable to resolve" + event.field, null);
      break;
  }
};