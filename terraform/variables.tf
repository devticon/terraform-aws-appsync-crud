variable "api_name" {
  description = "Must satisfy regex [a-zA-Z][-a-zA-Z0-9]*"
  type = string
  default = "appsync-module"
}

variable "dynamo_table_name" {
  description = "Must satisfy regex [_A-Za-z][_0-9A-Za-z]*"
  type = string
  default = "appsync_module"
}

variable "schema_path" {
  description = "Path to schema file"
  type = string
  default = "../schema.graphql"
}

variable "object_name" {
  description = "Object name used to distinguish CRUD modules. Added as prefix to db_table_name, api_name."
  type = string
  default = "item"
}