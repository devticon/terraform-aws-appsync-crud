data "local_file" "request_mapping" {
  filename = var.request_mapping_file_path
}

data "local_file" "response_mapping" {
  filename = var.response_mapping_file_path
}

resource "aws_cloudformation_stack" "resolver" {
  name = var.resolver_name

  parameters = {
    graphQlApiId = var.graphql_api_id
    dataSourceName = var.data_source_name
    fieldName = var.field_name
    typeName = var.type_name
    requestMappingTemplate = data.local_file.request_mapping.content
    responseMappingTemplate = data.local_file.response_mapping.content
  }

  template_body = var.template_body

}