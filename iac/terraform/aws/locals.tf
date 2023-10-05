locals {
  name    = "demo"
  service = "demo"
  common_tags = {
    Owner       = "demo"
    Environment = var.environment
    Project     = "demo"
    Terraform   = "true"
    ManagedBy   = "terraform"
  }

  map_roles = {
    dev = [
      {
        rolearn  = ""
        username = "OrganizationAccount"
        groups   = ["system:masters"]
      },
    ]
  }

  internal_domain = "demo.local"
  cidr            = "172.16.0.0/16"

  eks_node_groups = {
    dev = [
      {
        name             = "default"
        instance_type    = "t3.medium"
        desired_capacity = 3
        min_capacity     = 0
        max_capacity     = 6
        capacity_type    = "ON_DEMAND"
        k8s_labels       = {}
        taints           = []
      }
    ]
  }
}
