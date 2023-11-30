variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "nat_connectivity_type" {
  type    = string
  default = "public"
}

variable "subnet_availability_zone_1" {
  type    = string
  default = "us-east-2a"
}

variable "subnet_availability_zone_2" {
  type    = string
  default = "us-east-2b"
}

variable "pub_sub1_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "pub_sub2_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "priv_sub1_app_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "priv_sub2_app_cidr_block" {
  type    = string
  default = "10.0.3.0/24"
}

variable "priv_sub1_data_cidr_block" {
  type    = string
  default = "10.0.4.0/24"
}

variable "priv_sub2_data_cidr_block" {
  type    = string
  default = "10.0.5.0/24"
}

variable "ami" {
  type    = string
  default = "ami-09f85f3aaae282910"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "loki-ohio"
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "db_engine_version" {
  type    = string
  default = "8.0.33"
}

variable "db_name" {
  type    = string
  default = "mydatabase"
}

variable "db_storage_type" {
  type    = string
  default = "gp2"
}

variable "db_allocated_storage" {
  type    = number
  default = 10
}

variable "db_identifier" {
  type    = string
  default = "mydb"
}

variable "db_username" {
  type    = string
  default = "loki"
}

variable "db_password" {
  type    = string
  default = "Loki7476"
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro"
}

variable "db_availability_zone" {
  type    = string
  default = "us-east-2a"
}

variable "db_subnet_group_name" {
  type    = string
  default = "my_db_subnet_group"
}

variable "efs_creation_token" {
  type    = string
  default = "efs"
}

variable "efs_performance_mode" {
  type    = string
  default = "generalPurpose"
}

variable "efs_throughput_mode" {
  type    = string
  default = "elastic"
}

variable "lb_name" {
  type    = string
  default = "my-lb"
}

variable "lb_load_balancer_type" {
  type    = string
  default = "application"
}

variable "lb_ip_address_type" {
  type    = string
  default = "ipv4"
}

variable "lb_tg_name" {
  type    = string
  default = "my-alb-tg"
}

variable "lb_tg_port" {
  type    = number
  default = 80
}

variable "lb_tg_protocol" {
  type    = string
  default = "HTTP"
}

variable "lb_tg_target_type" {
  type    = string
  default = "instance"
}

variable "lb_listner_port" {
  type    = number
  default = 80
}

variable "lb_listner_protocol" {
  type    = string
  default = "HTTP"
}

variable "launch_conf_name" {
  type    = string
  default = "webserver-launch-config"
}

variable "launch_conf_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "launch_conf_volume_type" {
  type    = string
  default = "gp2"
}

variable "asg_name" {
  type    = string
  default = "myasg"
}

variable "asg_health_check_type" {
  type    = string
  default = "ELB"
}