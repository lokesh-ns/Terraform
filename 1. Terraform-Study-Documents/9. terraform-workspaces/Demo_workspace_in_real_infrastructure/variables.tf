variable "ami" {
  description = "this is the ami of instance"
}

variable "instance_type" {
  description = "this is the type of instance"
  type = map(string)
  default = {
    "dev" = "t2.micro",
    "test" = "t2.nano"
  }
}