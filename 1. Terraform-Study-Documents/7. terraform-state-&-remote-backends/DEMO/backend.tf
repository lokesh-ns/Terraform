terraform {
  backend "s3" {
    bucket = "loki-bucket-samples-test2"
    key    = "lns/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}