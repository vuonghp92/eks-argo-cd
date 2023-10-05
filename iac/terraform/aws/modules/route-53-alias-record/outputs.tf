output "hostnames" {
  value       = module.alias_record.hostnames
  description = "List of DNS records"
}

output "parent_zone_id" {
  value       = module.alias_record.parent_zone_id
  description = "ID of the hosted zone to contain the records"
}

output "parent_zone_name" {
  value       = module.alias_record.parent_zone_name
  description = "Name of the hosted zone to contain the records"
}
