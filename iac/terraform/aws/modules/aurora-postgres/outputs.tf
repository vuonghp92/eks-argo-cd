output "cluster_identifier" {
  value       = module.rds_cluster_aurora_postgres.cluster_identifier
  description = "Cluster Identifier"
}

output "arn" {
  value       = module.rds_cluster_aurora_postgres.arn
  description = "Amazon Resource Name (ARN) of the cluster"
}

output "endpoint" {
  value       = module.rds_cluster_aurora_postgres.endpoint
  description = "The DNS address of the RDS instance"
}

output "reader_endpoint" {
  value       = module.rds_cluster_aurora_postgres.reader_endpoint
  description = "A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas"
}

output "dns_master" {
  value       = aws_route53_record.dns_master.fqdn
  description = "The DNS address of the RDS master"
}

output "dns_reader" {
  value       = aws_route53_record.dns_reader.fqdn
  description = "The DNS address of the RDS reader"
}

output "master_host" {
  value       = module.rds_cluster_aurora_postgres.master_host
  description = "DB Master hostname"
}

output "replicas_host" {
  value       = module.rds_cluster_aurora_postgres.replicas_host
  description = "Replicas hostname"
}

output "dbi_resource_ids" {
  value       = module.rds_cluster_aurora_postgres.dbi_resource_ids
  description = "List of the region-unique, immutable identifiers for the DB instances in the cluster"
}

output "cluster_resource_id" {
  value       = module.rds_cluster_aurora_postgres.cluster_resource_id
  description = "The region-unique, immutable identifie of the cluster"
}

output "cluster_security_groups" {
  value       = module.rds_cluster_aurora_postgres.cluster_security_groups
  description = "Default RDS cluster security groups"
}

output "security_group_id" {
  value       = module.rds_cluster_aurora_postgres.security_group_id
  description = "Security Group ID"
}

output "admin_secretmanager_name" {
  description = "secretmanager name for admin credential "
  value       = aws_secretsmanager_secret.rds_credentials.name
}

output "admin_secretmanager_arn" {
  description = "secretmanager ARN for admin credential "
  value       = aws_secretsmanager_secret.rds_credentials.arn
}
