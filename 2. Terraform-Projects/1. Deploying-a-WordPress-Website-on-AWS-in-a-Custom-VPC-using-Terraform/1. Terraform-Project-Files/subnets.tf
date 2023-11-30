resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_1
  cidr_block = var.pub_sub1_cidr_block

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_2
  cidr_block = var.pub_sub2_cidr_block

  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_app_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_1
  cidr_block = var.priv_sub1_app_cidr_block

  tags = {
    Name = "private_app_subnet_1"
  }
}

resource "aws_subnet" "private_app_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_2
  cidr_block = var.priv_sub2_app_cidr_block

  tags = {
    Name = "private_app_subnet_2"
  }
}

resource "aws_subnet" "private_data_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_1
  cidr_block = var.priv_sub1_data_cidr_block

  tags = {
    Name = "private_data_subnet_1"
  }
}

resource "aws_subnet" "private_data_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  availability_zone = var.subnet_availability_zone_2
  cidr_block = var.priv_sub2_data_cidr_block

  tags = {
    Name = "private_data_subnet_2"
  }
}