output "iam_role_name" {
  description = "IAM Role name"
  value       = module.irsa.iam_role_name
}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = module.irsa.iam_role_arn
}
