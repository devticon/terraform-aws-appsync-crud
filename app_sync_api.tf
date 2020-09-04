module "appsync_api" {
  source = "./modules/appsync_api"
  api_name = "${terraform.workspace}-${var.object_name}-${var.api_name}"
  authentication_type = "API_KEY"
  dynamo_table_name = aws_dynamodb_table.main.name
  resolver_lambda_arn = module.resolver_lambda.lambda_arn
  resolver_lambda_name = module.resolver_lambda.function_name
  timestamp = timestamp()
  dynamo_table_arn = aws_dynamodb_table.main.arn
  schema_path = var.schema_path
}