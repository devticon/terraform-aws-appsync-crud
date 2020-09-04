locals {
  region         = "eu-west-2"
  prefix         = "workout"
}

provider "aws" {
  version = "~> 2.0"
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-states-collection"
    key    = "workout/appsynclambda/appsync-api.tfstate"
    region = "eu-west-2"
  }
}

