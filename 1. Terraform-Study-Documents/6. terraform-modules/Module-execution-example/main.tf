module "ec2_instance_module" {
  source = "C:/Users/HP/Desktop/Terraform-1/terraform-modules/ec2_instance_module"
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
}