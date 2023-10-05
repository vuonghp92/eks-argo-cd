# Required Variable
variable "name" {
  type        = string
  description = "A short name to attach to resources"
}

variable "region" {
  type        = string
  description = "AWS Region to attach to resources"
}

variable "environment" {
  type        = string
  description = "Environment to attach to resources"
}

variable "service" {
  type        = string
  description = "service of network"
}

variable "azs" {
  type        = list(string)
  description = "The AWS availability zones to deploy environment `ap-northeast-1a`"
}

variable "internal_domain" {
  type        = string
  description = "An internal DNS domain name to use for mapping IP addresses"
}

variable "cidr" {
  type        = string
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<-EOT
    Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).
    Neither the tag keys nor the tag values will be modified by this module.
    EOT
}
