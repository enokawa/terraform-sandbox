terraform {
  backend "s3" {
    bucket = "enokawa-terraform-sandbox-state"
    key    = "aws/dev/terraform.tfstate"
    region = "ap-northeast-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.63.0"
    }
  }

  required_version = ">= 1.4.5"
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Environment = local.env
      ProjectName = local.prefix
      CreatedBy   = "Terraform"
    }
  }
}
