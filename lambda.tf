module "resolver_lambda" {
  source = "./modules/resolver_lambda"
  function_name = "${terraform.workspace}_${var.object_name}_resolver_lambda"
  handler = "resolverLambda.handler"
  prefix = var.project_prefix
  source_path = "${path.module}/code/resolverLambda"
  dynamo_table_name = aws_dynamodb_table.main.name
}
