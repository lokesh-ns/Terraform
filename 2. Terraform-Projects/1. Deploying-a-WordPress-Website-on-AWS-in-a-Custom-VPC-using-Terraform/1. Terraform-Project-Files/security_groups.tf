resource "aws_security_group" "my_ALB_security_group" {
  name        = "ALB_security_group"
  description = "This is ALB_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "ALB_security_group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ALB_security_group"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "my_ssh_security_group" {
  name        = "ssh_security_groupp"
  description = "This is ssh_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "ssh_security_group"
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
}

resource "aws_security_group" "my_web_server_security_group" {
  name        = "web_server_security_group"
  description = "This is web_server_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "web_server_security_group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "web_server_security_group"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "web_server_security_group"
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
}

resource "aws_security_group" "my_database_security_group" {
  name        = "database_security_group"
  description = "This is database_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "database_security_group"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "my_efs_security_group" {
  name        = "efs_security_group"
  description = "This is efs_security_group"
  vpc_id      = aws_vpc.my_vpc.id

    ingress {
    description      = "efs_security_group"
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "efs_security_group"
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
}