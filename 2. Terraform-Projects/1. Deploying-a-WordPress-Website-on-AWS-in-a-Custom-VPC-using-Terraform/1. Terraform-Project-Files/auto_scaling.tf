resource "aws_launch_configuration" "my-launch-config" {
  name_prefix     = var.launch_conf_name
  image_id        = var.ami
  instance_type   = var.launch_conf_instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.my_web_server_security_group.id, aws_security_group.my_ssh_security_group.id ]

  root_block_device {
    volume_type = var.launch_conf_volume_type
    volume_size = 10
    encrypted   = true
  }

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = var.launch_conf_volume_type
    volume_size = 5
    encrypted   = true
  }


  lifecycle {
    create_before_destroy = true
  }
  user_data = filebase64("webserver_script.sh")
}

resource "aws_autoscaling_group" "my_asg" {
  name = var.asg_name
  vpc_zone_identifier = [aws_subnet.private_app_subnet_1.id, aws_subnet.private_app_subnet_2.id]
  health_check_type         = var.asg_health_check_type
  health_check_grace_period = 300
  max_size                  = 4
  min_size                  = 1
  desired_capacity          = 2
  depends_on = [ aws_lb.my_lb ]
  target_group_arns = [aws_lb_target_group.my_alb_tg.arn]
  launch_configuration = aws_launch_configuration.my-launch-config.name
  tag {
    key                 = "Name"
    value               = "ASG-Webserver"
    propagate_at_launch = true
  }
}