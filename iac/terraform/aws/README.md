## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.63.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.63.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | ./modules/acm | n/a |
| <a name="module_alb_controller_iam_role"></a> [alb\_controller\_iam\_role](#module\_alb\_controller\_iam\_role) | ./modules/eks-iam-role-with-oidc | n/a |
| <a name="module_argo-cd"></a> [argo-cd](#module\_argo-cd) | ./modules/route-53-alias-record | n/a |
| <a name="module_autoscaler_iam_role"></a> [autoscaler\_iam\_role](#module\_autoscaler\_iam\_role) | ./modules/eks-iam-role-with-oidc | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_eks-alb-argo-cd"></a> [eks-alb-argo-cd](#module\_eks-alb-argo-cd) | ./modules/eks-alb | n/a |
| <a name="module_external_dns_iam_role"></a> [external\_dns\_iam\_role](#module\_external\_dns\_iam\_role) | ./modules/eks-iam-role-with-oidc | n/a |
| <a name="module_external_secrets_iam_role"></a> [external\_secrets\_iam\_role](#module\_external\_secrets\_iam\_role) | ./modules/eks-iam-role-with-oidc | n/a |
eks-iam-role-with-oidc | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_postgres"></a> [postgres](#module\_postgres) | ./modules/aurora-postgres | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/ecr_repository) | resource |
| [aws_route53_zone.demo_com](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | The AWS availability zones to deploy environment | `list(string)` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name for which the certificate should be issued | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment to attach to resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-west-2"` | no |
| <a name="input_subject_alternative_name"></a> [subject\_alternative\_name](#input\_subject\_alternative\_name) | A domain that should be SANs in the issued certificate | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_controller_iam_role_arn"></a> [alb\_controller\_iam\_role\_arn](#output\_alb\_controller\_iam\_role\_arn) | alb\_controller IAM Role ARN |
| <a name="output_argo_cd_alb_target_group_arn"></a> [argo\_cd\_alb\_target\_group\_arn](#output\_argo\_cd\_alb\_target\_group\_arn) | ALB Target Group ARN for argo CD |
| <a name="output_autoscaler_iam_role_arn"></a> [autoscaler\_iam\_role\_arn](#output\_autoscaler\_iam\_role\_arn) | autoscaler IAM Role ARN |
| <a name="output_bff_alb_target_group_arn"></a> [bff\_alb\_target\_group\_arn](#output\_bff\_alb\_target\_group\_arn) | ALB Target Group ARN for bff |
| <a name="output_dynamodb_controller_iam_role_arn"></a> [dynamodb\_controller\_iam\_role\_arn](#output\_dynamodb\_controller\_iam\_role\_arn) | dynamodb\_controller IAM Role ARN |
| <a name="output_external_dns_iam_role_arn"></a> [external\_dns\_iam\_role\_arn](#output\_external\_dns\_iam\_role\_arn) | external\_dns IAM Role ARN |
| <a name="output_msk_bootstrap_brokers_scram"></a> [msk\_bootstrap\_brokers\_scram](#output\_msk\_bootstrap\_brokers\_scram) | A comma separated list of one or more hostname:port pairs of kafka brokers suitable to boostrap connectivity to the kafka cluster |
| <a name="output_msk_cluster_arn"></a> [msk\_cluster\_arn](#output\_msk\_cluster\_arn) | Amazon Resource Name (ARN) of the MSK cluster |
| <a name="output_msk_cluster_name"></a> [msk\_cluster\_name](#output\_msk\_cluster\_name) | MSK Cluster name |
| <a name="output_network_cidr"></a> [network\_cidr](#output\_network\_cidr) | Network CIDR address space. |
| <a name="output_network_dns_zone_id"></a> [network\_dns\_zone\_id](#output\_network\_dns\_zone\_id) | The VPC network DNS ID. |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The VPC network ID. |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Short name to identify environment. |
| <a name="output_network_private_subnet_cidrs"></a> [network\_private\_subnet\_cidrs](#output\_network\_private\_subnet\_cidrs) | CIDR blocks of the created private subnets |
| <a name="output_network_private_subnet_ids"></a> [network\_private\_subnet\_ids](#output\_network\_private\_subnet\_ids) | n/a |
| <a name="output_network_public_subnet_cidrs"></a> [network\_public\_subnet\_cidrs](#output\_network\_public\_subnet\_cidrs) | CIDR blocks of the created public subnets |
| <a name="output_network_public_subnet_ids"></a> [network\_public\_subnet\_ids](#output\_network\_public\_subnet\_ids) | n/a |
