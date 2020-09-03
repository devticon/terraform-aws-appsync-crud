resource "aws_appsync_datasource" "lambda_data_source" {
  api_id           = aws_appsync_graphql_api.main.id
  name             = var.resolver_lambda_name
  service_role_arn = aws_iam_role.api.arn
  type             = "AWS_LAMBDA"
  lambda_config{
    function_arn = var.resolver_lambda_arn
  }

}

resource "aws_appsync_datasource" "dynamo_data_source" {
  api_id           = aws_appsync_graphql_api.main.id
  name             = var.dynamo_table_name
  service_role_arn = aws_iam_role.api.arn
  type             = "AMAZON_DYNAMODB"

  dynamodb_config {
    table_name = var.dynamo_table_name
  }

}