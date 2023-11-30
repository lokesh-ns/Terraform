resource "local_file" "test_files" {
  filename = var.filename
  content = var.filecontent
}

output "var_output" {
  value = var.filecontent
}

