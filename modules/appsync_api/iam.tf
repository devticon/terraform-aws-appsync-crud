resource "aws_iam_role" "api" {
  name = "${var.api_name}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "appsync.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "api_to_lambda_policy" {
  name = "${var.api_name}_api_lambda_policy"
  role = aws_iam_role.api.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "dynamodb:*"
            ],
            "Resource": [
                "${var.resolver_lambda_arn}",
                "${var.dynamo_table_arn}"]

        }
    ]
}
EOF
}