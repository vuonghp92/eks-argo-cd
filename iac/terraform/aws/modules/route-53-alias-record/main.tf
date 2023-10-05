module "alias_record" {
  source  = "cloudposse/route53-alias/aws"
  version = "0.12.1"

  aliases         = var.aliases
  parent_zone_id  = var.parent_zone_id
  target_dns_name = var.target_dns_name
  target_zone_id  = var.target_zone_id
}
