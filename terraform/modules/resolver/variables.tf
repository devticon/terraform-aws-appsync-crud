variable "request_mapping_file_path" {
  type = string
}

variable "response_mapping_file_path" {
  type = string
}

variable "resolver_name" {
  type = string
}

variable "graphql_api_id" {
  type = string
}

variable "data_source_name" {
  type = string
}

variable "template_body" {
  type = string
}

variable "field_name" {
  type = string
}

variable "type_name" {
  type = string
}

variable "data_source_type" {
  type = string
  default = "AWS_LAMBDA"
}