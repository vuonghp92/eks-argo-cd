module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.2.1"

  domain_name = var.domain_name
  zone_id     = var.zone_id

  subject_alternative_names = [
    var.subject_alternative_name,
  ]
  wait_for_validation = true
  tags                = var.tags
}
