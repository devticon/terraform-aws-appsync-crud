resource "aws_appsync_graphql_api" "main" {
  authentication_type = var.authentication_type
  name                = var.api_name

  log_config {
    cloudwatch_logs_role_arn = aws_iam_role.api.arn
    field_log_level          = "ERROR"
  }


}

resource "aws_appsync_api_key" "main_key" {
  api_id  = aws_appsync_graphql_api.main.id
}

resource "aws_iam_role_policy_attachment" "logs" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppSyncPushToCloudWatchLogs"
  role       = aws_iam_role.api.name
}
