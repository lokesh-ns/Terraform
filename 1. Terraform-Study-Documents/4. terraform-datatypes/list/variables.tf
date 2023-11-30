variable "file_name" {
    type = list
    default = ["C:/Users/HP/Desktop/Terraform-1/terraform-datatypes/list/list_test_file1.txt", "C:/Users/HP/Desktop/Terraform-1/terraform-datatypes/list/list_test_file2.txt"]
}

variable "file_list_content" {
  type = list
  default = [1, 2]
}