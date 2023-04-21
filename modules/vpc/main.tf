resource "aws_vpc" "vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.prefix}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.prefix}-igw"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_public_1
  availability_zone       = var.aws_subnet_az1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-${var.prefix}-public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_public_2
  availability_zone       = var.aws_subnet_az2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-${var.prefix}-public-2"
  }
}

resource "aws_subnet" "protected_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_protected_1
  availability_zone       = var.aws_subnet_az1
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env}-${var.prefix}-protected-1"
  }
}

resource "aws_subnet" "protected_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_protected_2
  availability_zone       = var.aws_subnet_az2
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env}-${var.prefix}-protected-2"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_private_1
  availability_zone       = var.aws_subnet_az1
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env}-${var.prefix}-private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.aws_subnet_cidr_block_private_2
  availability_zone       = var.aws_subnet_az2
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.env}-${var.prefix}-private-2"
  }
}

# If you are using a NAT Gateway, use the following resources.
# resource "aws_eip" "natgw_1_eip" {
#   vpc = true

#   tags = {
#     Name = "${var.env}-${var.prefix}-natgw-eip-1"
#   }
# }

# resource "aws_eip" "natgw_2_eip" {
#   vpc = true

#   tags = {
#     Name = "${var.env}-${var.prefix}-natgw-eip-2"
#   }
# }

# resource "aws_nat_gateway" "natgw_1" {
#   allocation_id = aws_eip.natgw_1_eip.id
#   subnet_id     = aws_subnet.public_1.id

#   tags = {
#     Name = "${var.env}-${var.prefix}-natgw-1"
#   }

#   depends_on = [aws_internet_gateway.igw]
# }

# resource "aws_nat_gateway" "natgw_2" {
#   allocation_id = aws_eip.natgw_2_eip.id
#   subnet_id     = aws_subnet.public_2.id

#   tags = {
#     Name = "${var.env}-${var.prefix}-natgw-2"
#   }

#   depends_on = [aws_internet_gateway.igw]
# }


resource "aws_route_table" "public_1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-${var.prefix}-public-1"
  }
}

resource "aws_route_table" "protected_1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

    # If you are using a NAT Gateway, use the following.
    # nat_gateway_id = aws_nat_gateway.natgw_1.id
  }

  tags = {
    Name = "${var.env}-${var.prefix}-protected-1"
  }
}

resource "aws_route_table" "protected_2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

    # If you are using a NAT Gateway, use the following.
    # nat_gateway_id = aws_nat_gateway.natgw_2.id
  }

  tags = {
    Name = "${var.env}-${var.prefix}-protected-2"
  }
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.prefix}-private-1"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_1.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_1.id
}

resource "aws_route_table_association" "protected_1" {
  subnet_id      = aws_subnet.protected_1.id
  route_table_id = aws_route_table.protected_1.id
}

resource "aws_route_table_association" "protected_2" {
  subnet_id      = aws_subnet.protected_2.id
  route_table_id = aws_route_table.protected_2.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_1.id
}
