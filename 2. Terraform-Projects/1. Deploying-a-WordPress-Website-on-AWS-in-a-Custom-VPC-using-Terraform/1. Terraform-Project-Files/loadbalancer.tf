resource "aws_lb" "my_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_load_balancer_type
  ip_address_type = var.lb_ip_address_type
  security_groups    = [aws_security_group.my_ALB_security_group.id, aws_security_group.my_web_server_security_group.id, aws_security_group.my_ssh_security_group.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb_target_group" "my_alb_tg" {
    health_check {
        interval = 300
        path = "/"
        protocol = "HTTP"
        timeout = 60
        healthy_threshold = 5
        unhealthy_threshold = 5
    }
    
    name        = var.lb_tg_name
    port        = var.lb_tg_port
    protocol    = var.lb_tg_protocol
    vpc_id      = aws_vpc.my_vpc.id
    target_type = var.lb_tg_target_type
}

resource "aws_lb_target_group_attachment" "my_alb_tg_attach_1" {
  target_group_arn = aws_lb_target_group.my_alb_tg.arn
  target_id        = aws_instance.setup_server.id
}

resource "aws_lb_listener" "my_alb_listner" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = var.lb_listner_port
  protocol          = var.lb_listner_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_alb_tg.arn
  }
}