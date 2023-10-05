locals {
  name                     = module.name_generator.name
  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  internal                 = false
  health_check_path        = var.health_check_path
  target_group_port        = 80
  target_group_protocol    = "HTTP"
  certificate_arn          = var.certificate_arn
  target_group_target_type = "ip"
  tags                     = var.tags
}

resource "aws_security_group" "this" {
  name        = "${module.name_generator.name}-sg"
  description = "Allow http and https inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, {
    Name = "${module.name_generator.name}-sg"
  })
}

resource "aws_lb" "default" {
  name               = local.name
  tags               = local.tags
  internal           = local.internal
  load_balancer_type = "application"

  security_groups = [aws_security_group.this.id]

  subnets                          = local.subnet_ids
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = true
  drop_invalid_header_fields       = true
}

resource "aws_lb_target_group" "this" {
  name                 = local.name
  port                 = local.target_group_port
  protocol             = local.target_group_protocol
  vpc_id               = var.vpc_id
  target_type          = local.target_group_target_type
  deregistration_delay = 15

  health_check {
    protocol            = "HTTP"
    path                = local.health_check_path
    port                = "traffic-port"
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 15
    matcher             = "200-399"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = aws_lb.default.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.default.arn

  port            = 443
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn = local.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = "forward"
  }
}
