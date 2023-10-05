locals {
  domain = "${var.domain_name}."
}

data "aws_route53_zone" "terra_utm_com" {
  name         = local.domain
  private_zone = false
}

module "argo-cd" {
  source = "./modules/route-53-alias-record"

  aliases         = ["argo-cd.${local.domain}"]
  parent_zone_id  = data.aws_route53_zone.terra_utm_com.zone_id
  target_dns_name = module.eks-alb-argo-cd.alb_dns_name
  target_zone_id  = module.eks-alb-argo-cd.alb_zone_id
}

# module "bff" {
#   source = "./modules/route-53-alias-record"

#   aliases         = ["bff.${local.domain}"]
#   parent_zone_id  = data.aws_route53_zone.terra_utm_com.zone_id
#   target_dns_name = module.eks-alb-bff.alb_dns_name
#   target_zone_id  = module.eks-alb-bff.alb_zone_id
# }
