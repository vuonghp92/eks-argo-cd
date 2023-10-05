module "network" {
  source = "./modules/network"

  name            = local.name
  region          = var.region
  service         = local.service
  environment     = var.environment
  azs             = var.azs
  internal_domain = local.internal_domain
  cidr            = local.cidr
  tags            = local.common_tags
}

module "eks" {
  source = "./modules/eks"

  name                                 = local.name
  region                               = var.region
  environment                          = var.environment
  vpc_id                               = module.network.network_id
  subnet_ids                           = module.network.network_private_subnet_ids
  kubernetes_version                   = "1.21"
  node_groups                          = local.eks_node_groups[var.environment]
  map_roles                            = local.map_roles[var.environment]
  worker_additional_security_group_ids = []
  tags                                 = local.common_tags
}


module "eks-alb-argo-cd" {
  source = "./modules/eks-alb"

  name              = "${local.name}-argo-cd"
  environment       = var.environment
  vpc_id            = module.network.network_id
  subnet_ids        = module.network.network_public_subnet_ids
  health_check_path = "/healthz"
  certificate_arn   = module.acm.acm_certificate_arn
  tags              = local.common_tags
}


module "postgres" {
  source = "./modules/aurora-postgres"

  name                = local.name
  region              = var.region
  environment         = var.environment
  vpc_id              = module.network.network_id
  subnet_ids          = module.network.network_private_subnet_ids
  admin_user          = "sys_admin"
  db_name             = "homestead"
  allowed_cidr_blocks = module.network.network_private_subnet_cidrs
  dns_zone_id         = module.network.network_dns_zone_id
  tags                = local.common_tags
}

module "acm" {
  source = "./modules/acm"

  subject_alternative_name = var.subject_alternative_name
  domain_name              = var.domain_name
  zone_id                  = data.aws_route53_zone.demo_com.zone_id
  tags                     = local.common_tags
}
