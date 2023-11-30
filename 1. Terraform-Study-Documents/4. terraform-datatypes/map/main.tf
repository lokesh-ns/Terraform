resource "local_file" "files" {
  filename = var.file_name
  content = var.map_content["sample1"]
}