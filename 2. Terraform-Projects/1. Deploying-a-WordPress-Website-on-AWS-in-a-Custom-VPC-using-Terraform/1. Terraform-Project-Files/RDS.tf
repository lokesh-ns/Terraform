resource "aws_db_subnet_group" "my_db_subnet_group" {
  name =  var.db_subnet_group_name
  subnet_ids = [aws_subnet.private_data_subnet_1.id, aws_subnet.private_data_subnet_2.id]
}

resource "aws_db_instance" "my_db" {
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  db_name              = var.db_name
  storage_type         = var.db_storage_type
  allocated_storage    = var.db_allocated_storage 
  identifier           = var.db_identifier
  username             = var.db_username
  password             = var.db_password 
  instance_class       = var.db_instance_class
  availability_zone    = var.db_availability_zone
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.my_database_security_group.id]
}
