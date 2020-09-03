resource "aws_dynamodb_table" "main" {
  name           = "${terraform.workspace}_${var.object_name}_${var.dynamo_table_name}"
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"


  attribute {
    name = "id"
    type = "S"
  }
}