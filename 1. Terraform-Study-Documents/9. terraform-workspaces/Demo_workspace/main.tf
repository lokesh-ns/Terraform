module "Demo_module" {
  source = "C:/Users/HP/Desktop/Terraform/9. terraform-workspaces/Demo_module"
  ami = var.ami
  instance_type = var.instance_type
}