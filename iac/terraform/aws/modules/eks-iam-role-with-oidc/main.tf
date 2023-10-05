locals {
  flatList = join(",", var.service_accounts)
  replacedList = replace(
    replace(local.flatList, "/", ":"),
    "system:serviceaccount:",
    "",
  )
  serviceAccountList = formatlist("system:serviceaccount:%s", split(",", local.replacedList))
}

data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

resource "aws_iam_policy" "policy" {
  count = length(var.policies)

  name   = "${var.cluster_name}-${var.role_name}-${count.index}"
  policy = element(var.policies, count.index)

  lifecycle {
    create_before_destroy = true
  }
}

module "irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "4.7.0"

  create_role                   = true
  role_name                     = format("%s-%s", var.cluster_name, var.role_name)
  role_policy_arns              = [for policy in aws_iam_policy.policy : policy.arn]
  provider_url                  = data.aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  oidc_fully_qualified_subjects = local.serviceAccountList
  tags                          = var.tags
}
