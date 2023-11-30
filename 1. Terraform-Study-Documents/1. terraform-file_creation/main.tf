resource "local_file" "sample_files" {
    filename = "./sample_text_file.txt"
    content = "hey there, welcome to terraform course"
}