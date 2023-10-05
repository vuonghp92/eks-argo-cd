output "network_cidr" {
  value       = module.network.network_cidr
  description = "Network CIDR address space."
}

output "network_name" {
  value       = module.network.network_name
  description = "Short name to identify environment."
}

output "network_dns_zone_id" {
  value       = module.network.network_dns_zone_id
  description = "The VPC network DNS ID."
}

output "network_id" {
  value       = module.network.network_id
  description = "The VPC network ID."
}

output "network_public_subnet_ids" {
  value = module.network.network_public_subnet_ids
}

output "network_private_subnet_ids" {
  value = module.network.network_private_subnet_ids
}

output "network_public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value       = module.network.network_public_subnet_cidrs
}

output "network_private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value       = module.network.network_private_subnet_cidrs
}

output "autoscaler_iam_role_arn" {
  description = "autoscaler IAM Role ARN"
  value       = module.autoscaler_iam_role.iam_role_arn
}

output "alb_controller_iam_role_arn" {
  description = "alb_controller IAM Role ARN"
  value       = module.alb_controller_iam_role.iam_role_arn
}

output "external_dns_iam_role_arn" {
  description = "external_dns IAM Role ARN"
  value       = module.external_dns_iam_role.iam_role_arn
}

output "argo_cd_alb_target_group_arn" {
  description = "ALB Target Group ARN for argo CD"
  value       = module.eks-alb-argo-cd.target_group_arn
}
