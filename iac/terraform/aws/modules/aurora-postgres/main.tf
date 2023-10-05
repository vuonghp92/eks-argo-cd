locals {
  cluster_parameters = [
    {
      name         = "pgaudit.log"
      value        = "ddl,misc,role"
      apply_method = "immediate"
    },
    {
      name         = "pgaudit.log_catalog"
      value        = "1"
      apply_method = "immediate"
    },
    {
      name         = "pgaudit.log_relation"
      value        = "1"
      apply_method = "immediate"
    },
    {
      name         = "pgaudit.log_statement_once"
      value        = "1"
      apply_method = "immediate"
    },
    {
      name         = "pgaudit.role"
      value        = "rds_pgaudit"
      apply_method = "immediate"
    },
    {
      name         = "shared_preload_libraries"
      value        = "pg_stat_statements,pg_hint_plan,pgaudit"
      apply_method = "pending-reboot"
    },
    {
      name         = "lc_messages"
      value        = "C"
      apply_method = "immediate"
    },
    {
      name         = "lc_monetary"
      value        = "C"
      apply_method = "immediate"
    },
    {
      name         = "lc_numeric"
      value        = "C"
      apply_method = "immediate"
    },
    {
      name         = "lc_time"
      value        = "C"
      apply_method = "immediate"
    },
  ]
}

module "name_generator" {
  source = "../name-generator"
  name   = var.name
}

module "kms_key" {
  source  = "cloudposse/kms-key/aws"
  version = "0.11.0"

  environment             = var.environment
  name                    = module.name_generator.name
  description             = "KMS key for RDS cluster ${module.name_generator.name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags                    = var.tags
}

resource "random_password" "admin_password" {
  length  = 32
  special = false
}

resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "${module.name_generator.name}-rds-credential"
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({
    username            = var.admin_user
    password            = random_password.admin_password.result
    engine              = "aurora-postgresql"
    port                = 5432
    dbClusterIdentifier = module.rds_cluster_aurora_postgres.cluster_identifier
  })
}

module "rds_cluster_aurora_postgres" {
  source  = "cloudposse/rds-cluster/aws"
  version = "0.46.2"

  enabled                         = true
  name                            = module.name_generator.name
  engine                          = "aurora-postgresql"
  engine_version                  = var.cluster_engine_version
  cluster_family                  = var.cluster_family
  cluster_size                    = var.cluster_size
  backup_window                   = "16:00-17:00"
  maintenance_window              = "wed:18:00-wed:19:00"
  environment                     = var.environment
  admin_user                      = var.admin_user
  admin_password                  = random_password.admin_password.result
  db_name                         = var.db_name
  db_port                         = 5432
  instance_type                   = var.instance_type
  vpc_id                          = var.vpc_id
  subnets                         = var.subnet_ids
  allowed_cidr_blocks             = var.allowed_cidr_blocks
  storage_encrypted               = true
  kms_key_arn                     = module.kms_key.key_arn
  enabled_cloudwatch_logs_exports = ["postgresql"]
  cluster_parameters              = local.cluster_parameters
  tags                            = var.tags
}


resource "aws_route53_record" "dns_master" {
  name    = "${module.name_generator.name}-rds-master"
  zone_id = var.dns_zone_id
  type    = "CNAME"
  ttl     = 300
  records = [module.rds_cluster_aurora_postgres.endpoint]
}

resource "aws_route53_record" "dns_reader" {
  name    = "${module.name_generator.name}-rds-reader"
  zone_id = var.dns_zone_id
  type    = "CNAME"
  ttl     = 300
  records = [module.rds_cluster_aurora_postgres.reader_endpoint]
}
