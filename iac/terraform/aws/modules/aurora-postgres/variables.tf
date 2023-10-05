variable "name" {
  type        = string
  description = "The name of your Aurora cluster"
}

variable "region" {
  type        = string
  description = "AWS Region for the Aurora cluster"
}

variable "environment" {
  type        = string
  description = "Environment to attach to resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the Aurora cluster"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

variable "cluster_family" {
  type        = string
  description = "Cluster Family for the Aurora cluster"
  default     = "aurora-postgresql13"
}

variable "cluster_size" {
  type        = number
  description = "Cluster Size for the Aurora cluster"
  default     = 1
}

variable "cluster_engine_version" {
  type        = string
  description = "Engine Version for the Aurora cluster"
  default     = "13.3"
}

variable "admin_user" {
  type        = string
  description = "Admin user for the Aurora cluster"
}

variable "db_name" {
  type        = string
  description = "DB Name for the Aurora cluster"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the Aurora cluster"
  default     = "db.t4g.medium"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "Access cidr for the Aurora cluster"
}

variable "dns_zone_id" {
  type        = string
  description = "Route53 zone id for the MSK"
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<-EOT
    Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).
    Neither the tag keys nor the tag values will be modified by this module.
    EOT
}
