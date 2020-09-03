module "lambda_function" {
  source         = "devticon/lambda/aws"
  create_package = false
  function_name  = var.function_name
  handler        = var.handler
  source_path    = var.source_path
  timeout        = var.timeout
  layers = var.layers

  policy_statements = {
    statements = {
      actions   = var.policy_actions,
      resources = var.policy_resources
    },
  }

  environment_variables = {
    dynamo_table_name =var.dynamo_table_name
  }
}