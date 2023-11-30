output "instance_data" {
  description = "getting the instance public ip"
  value = aws_instance.sample_instance.public_ip
}