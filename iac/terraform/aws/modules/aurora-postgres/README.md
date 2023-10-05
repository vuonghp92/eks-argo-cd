## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms_key"></a> [kms\_key](#module\_kms\_key) | cloudposse/kms-key/aws | 0.11.0 |
| <a name="module_name_generator"></a> [name\_generator](#module\_name\_generator) | ../name-generator | n/a |
| <a name="module_rds_cluster_aurora_postgres"></a> [rds\_cluster\_aurora\_postgres](#module\_rds\_cluster\_aurora\_postgres) | cloudposse/rds-cluster/aws | 0.46.2 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dns_master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.dns_reader](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_secretsmanager_secret.rds_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.rds_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_password.admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Admin user for the Aurora cluster | `string` | n/a | yes |
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | Access cidr for the Aurora cluster | `list(string)` | n/a | yes |
| <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version) | Engine Version for the Aurora cluster | `string` | `"13.3"` | no |
| <a name="input_cluster_family"></a> [cluster\_family](#input\_cluster\_family) | Cluster Family for the Aurora cluster | `string` | `"aurora-postgresql13"` | no |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Cluster Size for the Aurora cluster | `number` | `1` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | DB Name for the Aurora cluster | `string` | n/a | yes |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | Route53 zone id for the MSK | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment to attach to resources | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for the Aurora cluster | `string` | `"db.t4g.medium"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of your Aurora cluster | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region for the Aurora cluster | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to launch the cluster in | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for the Aurora cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_secretmanager_arn"></a> [admin\_secretmanager\_arn](#output\_admin\_secretmanager\_arn) | secretmanager ARN for admin credential |
| <a name="output_admin_secretmanager_name"></a> [admin\_secretmanager\_name](#output\_admin\_secretmanager\_name) | secretmanager name for admin credential |
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the cluster |
| <a name="output_cluster_identifier"></a> [cluster\_identifier](#output\_cluster\_identifier) | Cluster Identifier |
| <a name="output_cluster_resource_id"></a> [cluster\_resource\_id](#output\_cluster\_resource\_id) | The region-unique, immutable identifie of the cluster |
| <a name="output_cluster_security_groups"></a> [cluster\_security\_groups](#output\_cluster\_security\_groups) | Default RDS cluster security groups |
| <a name="output_dbi_resource_ids"></a> [dbi\_resource\_ids](#output\_dbi\_resource\_ids) | List of the region-unique, immutable identifiers for the DB instances in the cluster |
| <a name="output_dns_master"></a> [dns\_master](#output\_dns\_master) | The DNS address of the RDS master |
| <a name="output_dns_reader"></a> [dns\_reader](#output\_dns\_reader) | The DNS address of the RDS reader |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The DNS address of the RDS instance |
| <a name="output_master_host"></a> [master\_host](#output\_master\_host) | DB Master hostname |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas |
| <a name="output_replicas_host"></a> [replicas\_host](#output\_replicas\_host) | Replicas hostname |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group ID |
