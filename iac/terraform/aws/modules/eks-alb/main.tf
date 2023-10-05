module "name_generator" {
  source = "../name-generator"
  name   = var.name
}

module "alb_ingress" {
  source  = "cloudposse/alb-ingress/aws"
  version = "0.24.0"

  environment                   = var.environment
  name                          = module.name_generator.name
  vpc_id                        = var.vpc_id
  unauthenticated_priority      = 1
  unauthenticated_paths         = ["/*"]
  stickiness_enabled            = false
  default_target_group_enabled  = false
  target_group_arn              = aws_lb_target_group.this.arn
  unauthenticated_listener_arns = [aws_lb_listener.https.arn]
  tags                          = var.tags
}
