resource "aws_nat_gateway" "ngw_1" {
  subnet_id = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.eip_1.id
  connectivity_type = var.nat_connectivity_type
  tags = {
    Name = "ngw_1"
  }
}

resource "aws_nat_gateway" "ngw_2" {
  subnet_id = aws_subnet.public_subnet_2.id
  allocation_id = aws_eip.eip_2.id
  connectivity_type = var.nat_connectivity_type
  tags = {
    Name = "ngw_2"
  }
}