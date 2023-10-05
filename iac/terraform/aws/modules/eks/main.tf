locals {
  node_groups = { for node in var.node_groups : node.name => {
    name             = node.name
    instance_types   = [node.instance_type]
    desired_capacity = node.desired_capacity
    min_capacity     = node.min_capacity
    max_capacity     = node.max_capacity
    capacity_type    = node.capacity_type
    k8s_labels       = node.k8s_labels
    taints           = node.taints
  } }
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "name_generator" {
  source = "../name-generator"
  name   = "${var.environment}-${var.name}"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.20.0"

  cluster_name              = module.name_generator.name
  cluster_version           = var.kubernetes_version
  subnets                   = var.subnet_ids
  tags                      = var.tags
  vpc_id                    = var.vpc_id
  enable_irsa               = true
  write_kubeconfig          = false
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 50
    k8s_labels = {
      Environment = var.environment
    }
    update_config = {
      max_unavailable_percentage = 50 # or set `max_unavailable`
    }
  }

  node_groups                          = local.node_groups
  map_roles                            = var.map_roles
  map_users                            = var.map_users
  worker_additional_security_group_ids = var.worker_additional_security_group_ids
}
