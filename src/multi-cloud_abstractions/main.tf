locals {
  location = {
    aws = "us-east-2c"
    gcp = "asia-northeast1"
  }
}

variable "project" {
  type = string
}

module "vpc" {
  # source = "../../modules/multi-cloud_abstractions/aws_vpc" # AWSのときはこちらを有効化
  # source = "../../modules/multi-cloud_abstractions/gcp_vpc" # GCPのときはこちらを有効化

  vpc = {
    name = "sample"
    cidr = "192.168.10.0/24"
  }

  subnets = [
    {
      name     = "sample"
      cidr     = "192.168.10.0/28"
      location = local.location[terraform.workspace]
    }
  ]

  project = var.project
}
