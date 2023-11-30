resource "aws_instance" "sample_instance" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
}