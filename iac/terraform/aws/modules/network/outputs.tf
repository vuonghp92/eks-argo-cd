output "network_cidr" {
  value       = module.vpc.vpc_cidr_block
  description = "Network CIDR address space."
}

output "network_name" {
  value       = module.name_generator.name
  description = "Short name to identify environment."
}

output "network_dns_zone_id" {
  value       = module.dns.zone_id
  description = "The VPC network DNS ID."
}

output "network_id" {
  value       = module.vpc.vpc_id
  description = "The VPC network ID."
}

output "network_public_subnet_ids" {
  value = module.dynamic_subnets.public_subnet_ids
}

output "network_private_subnet_ids" {
  value = module.dynamic_subnets.private_subnet_ids
}

output "network_public_subnet_cidrs" {
  description = "CIDR blocks of the created public subnets"
  value       = module.dynamic_subnets.public_subnet_cidrs
}

output "network_private_subnet_cidrs" {
  description = "CIDR blocks of the created private subnets"
  value       = module.dynamic_subnets.private_subnet_cidrs
}

output "gateway_vpc_endpoints" {
  value       = module.vpc_endpoints.gateway_vpc_endpoints
  description = "List of Gateway VPC Endpoints deployed to the VPC."
}
