locals {
  common_policy = [
    {
      Effect : "Allow",
      Action : [
        "S3:*",
        "dynamodb:*",
      ],
      Resource : "*",
    },
    {
      Effect : "Allow",
      Action : [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey",
      ],
      Resource : "arn:aws:kms:*:*:key/*",
    }
  ]

  backend_policies = {
    backend           = setunion(local.common_policy),
  }
}

module "service_iam_roles" {
  for_each     = local.backend_policies
  source       = "./modules/eks-iam-role-with-oidc"
  cluster_name = module.eks.cluster_id
  role_name    = "${replace(each.key, "_", "-")}-eks-role"
  tags         = local.common_tags
  service_accounts = [
    "demo/demo-${replace(each.key, "_", "-")}",
  ]
  policies = [
    jsonencode({
      Version : "2012-10-17",
      Statement : each.value,
    }),
  ]
}
