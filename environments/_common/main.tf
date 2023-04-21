module "vpc" {
  source = "../../modules/vpc"

  aws_vpc_cidr_block                = local.aws_vpc_cidr_block
  aws_subnet_cidr_block_public_1    = local.aws_subnet_cidr_block_public_1
  aws_subnet_cidr_block_public_2    = local.aws_subnet_cidr_block_public_2
  aws_subnet_cidr_block_protected_1 = local.aws_subnet_cidr_block_protected_1
  aws_subnet_cidr_block_protected_2 = local.aws_subnet_cidr_block_protected_2
  aws_subnet_cidr_block_private_1   = local.aws_subnet_cidr_block_private_1
  aws_subnet_cidr_block_private_2   = local.aws_subnet_cidr_block_private_2
  aws_subnet_az1                    = local.aws_subnet_az1
  aws_subnet_az2                    = local.aws_subnet_az2
  env                               = local.env
  prefix                            = local.prefix
}
