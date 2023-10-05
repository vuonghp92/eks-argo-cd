variable "name" {
  type        = string
  description = "Name of the hosted zone"
}

variable "service" {
  type        = string
  description = "service of the hosted zone"
}

variable "internal_domain" {
  type        = string
  description = "Abbreviation of the product domain this Route 53 zone belongs to"
}

variable "environment" {
  type        = string
  description = "Environment this Route 53 zone belongs to"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID that will be associated with this hosted zone"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<-EOT
    Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).
    Neither the tag keys nor the tag values will be modified by this module.
    EOT
}
