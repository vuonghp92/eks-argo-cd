variable "name" {
  type        = string
  description = "The name of your EKS cluster"
}

variable "region" {
  type        = string
  description = "AWS Region for the EKS cluster"
}

variable "environment" {
  type        = string
  description = "Environment to attach to resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the EKS cluster"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

variable "kubernetes_version" {
  type        = string
  default     = "1.21"
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
}

variable "node_groups" {
  type = list(object({
    name             = string
    instance_type    = string
    desired_capacity = number
    min_capacity     = number
    max_capacity     = number
    capacity_type    = string # ["ON_DEMAND", "SPOT"]
    k8s_labels       = map(string)
    taints           = list(map(string))
  }))
  default     = []
  description = "Manages [`node groups`] resources."
}

variable "worker_additional_security_group_ids" {
  description = "A list of worker security group ids to launch the cluster in"
  type        = list(string)
  default     = []
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. See examples/basic/variables.tf for example format."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<-EOT
    Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).
    Neither the tag keys nor the tag values will be modified by this module.
    EOT
}
