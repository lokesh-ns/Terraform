resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_IG.id
  }

  tags = {
    Name = "public_RT"
  }
}

resource "aws_route_table_association" "my_public_RTA_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "my_public_RTA_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table" "private_RT_1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_1.id
  }

  tags = {
    Name = "private_RT_1"
  }
}

resource "aws_route_table" "private_RT_2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_2.id
  }

  tags = {
    Name = "private_RT_2"
  }
}

resource "aws_route_table_association" "my_private_RTA_1a" {
  subnet_id      = aws_subnet.private_app_subnet_1.id
  route_table_id = aws_route_table.private_RT_1.id
}

resource "aws_route_table_association" "my_private_RTA_1b" {
  subnet_id      = aws_subnet.private_data_subnet_1.id
  route_table_id = aws_route_table.private_RT_1.id
}

resource "aws_route_table_association" "my_private_RTA_2a" {
  subnet_id      = aws_subnet.private_app_subnet_2.id
  route_table_id = aws_route_table.private_RT_2.id
}

resource "aws_route_table_association" "my_private_RTA_2b" {
  subnet_id      = aws_subnet.private_data_subnet_2.id
  route_table_id = aws_route_table.private_RT_2.id
}

resource "aws_eip" "eip_1" {
  depends_on = [aws_internet_gateway.my_IG]
}

resource "aws_eip" "eip_2" {
  depends_on = [aws_internet_gateway.my_IG]
}