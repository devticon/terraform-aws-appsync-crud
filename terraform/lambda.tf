module "resolver_lambda" {
  source = "./modules/resolver_lambda"
  function_name = "${terraform.workspace}_${var.object_name}_resolver_lambda"
  handler = "resolverLambda.handler"
  prefix = "novitus"
  source_path = "../code/resolverLambda"
  dynamo_table_name = aws_dynamodb_table.main.name
}
