variable "region" {
  type        = string
  default     = "us-west-2"
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "Environment to attach to resources"
}

variable "azs" {
  type        = list(string)
  description = "The AWS availability zones to deploy environment"
}

variable "subject_alternative_name" {
  description = "A domain that should be SANs in the issued certificate"
  type        = string
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
}
