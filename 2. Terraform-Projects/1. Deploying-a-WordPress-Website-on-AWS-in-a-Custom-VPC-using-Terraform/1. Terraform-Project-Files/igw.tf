resource "aws_internet_gateway" "my_IG" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_IG"
  }
}