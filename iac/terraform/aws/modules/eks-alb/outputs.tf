output "alb_name" {
  description = "The ARN suffix of the ALB"
  value       = local.name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.default.arn
}

output "alb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer"
  value       = aws_lb.default.zone_id
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.default.dns_name
}

output "security_group_id" {
  description = "The security group ID of the ALB"
  value       = aws_security_group.this.id
}

output "target_group_name" {
  description = "ALB Target Group name"
  value       = aws_lb_target_group.this.name
}

output "target_group_arn" {
  description = "ALB Target Group ARN"
  value       = aws_lb_target_group.this.arn
}
