resource "aws_efs_file_system" "my_efs" {
   creation_token = var.efs_creation_token
   performance_mode = var.efs_performance_mode
   throughput_mode = var.efs_throughput_mode
   encrypted = "true"
  tags = {
    Name = "EFS"
    }
}

resource "aws_efs_mount_target" "target_1" {
  file_system_id = aws_efs_file_system.my_efs.id
  subnet_id      = aws_subnet.private_data_subnet_1.id
  security_groups = [aws_security_group.my_efs_security_group.id, aws_security_group.my_ALB_security_group.id, aws_security_group.my_database_security_group.id]
}

resource "aws_efs_mount_target" "target_2" {
  file_system_id = aws_efs_file_system.my_efs.id
  subnet_id      = aws_subnet.private_data_subnet_2.id
  security_groups = [aws_security_group.my_efs_security_group.id, aws_security_group.my_ALB_security_group.id, aws_security_group.my_database_security_group.id]
}