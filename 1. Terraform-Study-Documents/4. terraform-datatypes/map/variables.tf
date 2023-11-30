variable "file_name" {
  default = "C:/Users/HP/Desktop/Terraform-1/terraform-datatypes/map/map_test_file1.txt"
}

variable "map_content" {
  type = map
  default = {
    "sample1"= "this is sample 1"
    "sample2" = "this is sample 2"
  }
}