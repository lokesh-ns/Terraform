resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

    tags = {
    Name = "my_vpc"
  }
}
