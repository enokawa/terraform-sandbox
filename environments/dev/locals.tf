# Common
locals {
  env    = "dev"
  prefix = "sandbox"
}

# VPC
locals {
  aws_vpc_cidr_block                = "10.0.0.0/16"
  aws_subnet_cidr_block_public_1    = "10.0.0.0/20"
  aws_subnet_cidr_block_public_2    = "10.0.16.0/20"
  aws_subnet_cidr_block_protected_1 = "10.0.64.0/20"
  aws_subnet_cidr_block_protected_2 = "10.0.80.0/20"
  aws_subnet_cidr_block_private_1   = "10.0.128.0/20"
  aws_subnet_cidr_block_private_2   = "10.0.144.0/20"
  aws_subnet_az1                    = "ap-northeast-1a"
  aws_subnet_az2                    = "ap-northeast-1c"
}
