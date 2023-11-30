resource "local_file" "files" {
  filename = var.file_name[0]
  content = var.file_list_content[0]
}

resource "local_file" "new_files" {
  filename = var.file_name[1]
  content = var.file_list_content[1]
}

output "data" {
  description = "I am getting you the data of the list"
  value = local_file.files.filename
}