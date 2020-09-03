variable "authentication_type" {
  type = string
}

variable "api_name" {
  type = string
}

variable "resolver_lambda_arn" {
  type = string
}

variable "resolver_lambda_name" {
  type = string
}

variable "dynamo_table_arn" {
  type = string
}

variable "dynamo_table_name" {
  type = string
}

variable "timestamp" {
  type = string
  default = ""
}

variable "schema_path" {
  type = string
}