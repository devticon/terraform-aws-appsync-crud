data "local_file" "cloudformation_schema_template" {
  filename = "${path.root}/crud-api/cloudformation-templates/schema.json"
}

data "local_file" "schema" {
  filename = "${path.root}/schema.graphql"
}

resource "aws_cloudformation_stack" "api_schema" {
  depends_on = [aws_appsync_graphql_api.main]
  name = "${var.api_name}-schema"

  parameters = {
    graphQlApiId = aws_appsync_graphql_api.main.id
    graphQlSchema = data.local_file.schema.content
  }

  template_body = data.local_file.cloudformation_schema_template.content

}