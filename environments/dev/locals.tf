locals {
  aws_vpc_cidr_block             = "10.0.0.0/16"
  aws_subnet_cidr_block_public_1 = "10.0.0.0/20"
  aws_subnet_az1                 = "ap-northeast-1a"
  aws_subnet_az2                 = "ap-northeast-1c"
  env                            = "dev"
  prefix                         = "sandbox"
}
