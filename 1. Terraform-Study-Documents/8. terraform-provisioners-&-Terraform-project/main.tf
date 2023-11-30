resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_RT" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }
}

resource "aws_route_table_association" "my_RT_A1" {
  subnet_id      = aws_subnet.my_subnet1.id
  route_table_id = aws_route_table.my_RT.id
}

resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "my_security_group inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_my_SG"
  }
}

resource "aws_instance" "my_instance" {
  ami = "ami-0df435f331839b2d6"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  subnet_id = aws_subnet.my_subnet1.id
  associate_public_ip_address = true
  key_name = "loki-us-east-1"
  
  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    private_key = file("C:/Users/HP/Downloads/loki-us-east-1.pem")  # Replace with the path to your private key
    host        = self.public_ip
  }
  
  provisioner "file" {
    source = "./Portfolio"
    destination = "/home/ec2-user/Portfolio" 
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ec2-user/Portfolio",
      "sudo yum install pip -y",
      "sudo pip install -r requirements.txt",
      "sudo python3 manage.py runserver 0.0.0.0:80",
    ]
  }
  
}

