data "local_file" "cloudformation_resolver_template" {
  filename = "${path.module}/cloudformation-templates/resolver.json"
}

module "add_resolver" {
  source = "./modules/resolver"
  data_source_name = module.resolver_lambda.function_name
  field_name = "add"
  graphql_api_id = module.appsync_api.api_id
  request_mapping_file_path = "${path.module}/api/resolvers/add-request-mapping-template.txt"
  resolver_name = "${module.appsync_api.api_name}-add-resolver"
  response_mapping_file_path = "${path.module}/api/resolvers/add-response-mapping-template.txt"
  template_body = data.local_file.cloudformation_resolver_template.content
  type_name = "Mutation"

  depends_on = [
    module.appsync_api
  ]
}

module "update_resolver" {
  source = "./modules/resolver"
  data_source_name = module.resolver_lambda.function_name
  field_name = "update"
  graphql_api_id = module.appsync_api.api_id
  request_mapping_file_path = "${path.module}/api/resolvers/update-request-mapping-template.txt"
  resolver_name = "${module.appsync_api.api_name}-update-resolver"
  response_mapping_file_path = "${path.module}/api/resolvers/update-response-mapping-template.txt"
  template_body = data.local_file.cloudformation_resolver_template.content
  type_name = "Mutation"
  data_source_type = "AWS_LAMBDA"

  depends_on = [
    module.appsync_api
  ]
}

module "delete_resolver" {
  source = "./modules/resolver"
  data_source_name = module.resolver_lambda.function_name
  field_name = "delete"
  graphql_api_id = module.appsync_api.api_id
  request_mapping_file_path = "${path.module}/api/resolvers/delete-request-mapping-template.txt"
  resolver_name = "${module.appsync_api.api_name}-delete-resolver"
  response_mapping_file_path = "${path.module}/api/resolvers/delete-response-mapping-template.txt"
  template_body = data.local_file.cloudformation_resolver_template.content
  type_name = "Mutation"

  depends_on = [
    module.appsync_api
  ]
}

module "get_resolver" {
  source = "./modules/resolver"
  data_source_name = module.resolver_lambda.function_name
  field_name = "get"
  graphql_api_id = module.appsync_api.api_id
  request_mapping_file_path = "${path.module}/api/resolvers/get-request-mapping-template.txt"
  resolver_name = "${module.appsync_api.api_name}-get-resolver"
  response_mapping_file_path = "${path.module}/api/resolvers/get-response-mapping-template.txt"
  template_body = data.local_file.cloudformation_resolver_template.content
  type_name = "Query"

  depends_on = [
    module.appsync_api
  ]
}

module "list_resolver" {
  source = "./modules/resolver"
  data_source_name = aws_dynamodb_table.main.name
  field_name = "list"
  graphql_api_id = module.appsync_api.api_id
  request_mapping_file_path = "${path.module}/api/resolvers/list-request-mapping-template.txt"
  resolver_name = "${module.appsync_api.api_name}-list-posts-resolver"
  response_mapping_file_path = "${path.module}/api/resolvers/list-response-mapping-template.txt"
  template_body = data.local_file.cloudformation_resolver_template.content
  type_name = "Query"

  depends_on = [
    module.appsync_api
  ]
}