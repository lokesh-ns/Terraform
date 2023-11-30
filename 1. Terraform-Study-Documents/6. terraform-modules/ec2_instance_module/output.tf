output "instance_output_data" {
  description = "getting instance required data"
  value = aws_instance.instance1.public_ip
}