variable "function_name" {
  type = string
}

variable "handler" {
  type = string
}

variable "source_path" {
  type = string
}

variable "prefix" {
  type = string
}

variable "timeout" {
  type = number
  default = 20
}

variable "layers" {
  type = list(string)
  default = []
}

variable "policy_actions" {
  type = list(string)
  default = [
    "logs:CreateLogStream",
    "logs:PutLogEvents",
    "dynamodb:*"
  ]
}

variable "policy_resources" {
  type = list(string)
  default = ["*"]
}

variable "dynamo_table_name" {
  type = string
}