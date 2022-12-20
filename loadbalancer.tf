resource "aws_lb_target_group" "targetgroup" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "targetgroup"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
}


resource "aws_lb" "application_lb" {
  name               = "application-lb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
}


resource "aws_lb_listener" "alb_listener443" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:533084366484:certificate/684d7dcb-62e8-42e2-b95f-1a5dae672a83"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup.arn
  }
}

resource "aws_lb_listener" "alb_listener80" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"

   redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group_attachment" "ec2_attach" {
  count            = length(aws_instance.ec2_instance)
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.ec2_instance[count.index].id
}