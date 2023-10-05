locals {
  gateway_vpc_endpoints = {
    "s3" = {
      name = "s3"
      policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Action = [
              "s3:*",
            ]
            Effect    = "Allow"
            Principal = "*"
            Resource  = "*"
          },
        ]
      })
    }
    "dynamodb" = {
      name   = "dynamodb"
      policy = null
    }
  }
}

module "name_generator" {
  source = "../name-generator"
  name   = var.name
}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "0.27.0"

  environment = var.environment
  name        = module.name_generator.name
  cidr_block  = var.cidr
  tags        = var.tags
}

module "dynamic_subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "0.39.5"

  environment        = var.environment
  name               = module.name_generator.name
  availability_zones = var.azs
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.vpc.igw_id
  cidr_block         = var.cidr
  tags               = var.tags
}

module "dns" {
  source = "./dns"

  name            = module.name_generator.name
  service         = var.service
  environment     = var.environment
  internal_domain = var.internal_domain
  vpc_id          = module.vpc.vpc_id
}

module "vpc_endpoints" {
  source  = "cloudposse/vpc/aws//modules/vpc-endpoints"
  version = "0.27.0"

  vpc_id = module.vpc.vpc_id

  gateway_vpc_endpoints = local.gateway_vpc_endpoints
}

resource "aws_vpc_endpoint_route_table_association" "s3_vpc_endpoint_private_route_table_association" {
  count           = length(module.dynamic_subnets.private_route_table_ids)
  route_table_id  = module.dynamic_subnets.private_route_table_ids[count.index]
  vpc_endpoint_id = module.vpc_endpoints.gateway_vpc_endpoints[0].id
}

resource "aws_vpc_endpoint_route_table_association" "dynamodb_vpc_endpoint_private_route_table_association" {
  count           = length(module.dynamic_subnets.private_route_table_ids)
  route_table_id  = module.dynamic_subnets.private_route_table_ids[count.index]
  vpc_endpoint_id = module.vpc_endpoints.gateway_vpc_endpoints[1].id
}
