resource "aws_lb_target_group" "main" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    protocol            = var.health_check_protocol
    path                = var.health_check_path
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher

  }

  tags = var.target_group_tags
}

resource "aws_lb" "main" {
  name                       = var.lb_name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = var.deletion_protection

  tags = var.lb_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
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

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_security_group" "alb_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.egress_cidr_blocks]
  }
}
