variable "name" {
  type        = string
  description = "The name of your MSK"
}

variable "environment" {
  type        = string
  description = "Environment to attach to resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the MSK"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the cluster in"
  type        = list(string)
}

variable "access_logs_enabled" {
  description = "A boolean flag to enable/disable access_logs"
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
  default     = "/"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = <<-EOT
    Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).
    Neither the tag keys nor the tag values will be modified by this module.
    EOT
}

variable "certificate_arn" {
  type        = string
  default     = ""
  description = "The ARN of the default SSL certificate for HTTPS listener"
}
