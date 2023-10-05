module "autoscaler_iam_role" {
  source       = "./modules/eks-iam-role-with-oidc"
  cluster_name = module.eks.cluster_id
  role_name    = "autoscaler-eks-role"
  tags         = local.common_tags
  service_accounts = [
    "kube-system/autoscaler",
  ]
  policies = [
    jsonencode({
      Version : "2012-10-17",
      Statement : [
        {
          Effect : "Allow",
          Action : [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "autoscaling:DescribeTags",
            "ec2:DescribeLaunchTemplateVersions"
          ],
          Resource : "*",
        }
      ],
    }),
  ]
}

module "alb_controller_iam_role" {
  source       = "./modules/eks-iam-role-with-oidc"
  cluster_name = module.eks.cluster_id
  role_name    = "alb-controller-eks-role"
  tags         = local.common_tags
  service_accounts = [
    "kube-system/alb-controller",
  ]
  policies = [
    file("./files/iam-policies/alb_controller_iam_policy.json")
  ]
}

module "external_dns_iam_role" {
  source       = "./modules/eks-iam-role-with-oidc"
  cluster_name = module.eks.cluster_id
  role_name    = "external-dns-eks-role"
  tags         = local.common_tags
  service_accounts = [
    "external-dns/external-dns",
  ]
  policies = [
    file("./files/iam-policies/external_dns_iam_policy.json")
  ]
}

module "external_secrets_iam_role" {
  source       = "./modules/eks-iam-role-with-oidc"
  cluster_name = module.eks.cluster_id
  role_name    = "external-secrets-eks-role"
  tags         = local.common_tags
  service_accounts = [
    "external-secrets/external-secrets",
  ]
  policies = [
    file("./files/iam-policies/external_secrets_iam_policy.json")
  ]
}

