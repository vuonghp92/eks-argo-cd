## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alias_record"></a> [alias\_record](#module\_alias\_record) | cloudposse/route53-alias/aws | 0.12.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | List of aliases | `list(string)` | n/a | yes |
| <a name="input_parent_zone_id"></a> [parent\_zone\_id](#input\_parent\_zone\_id) | ID of the hosted zone to contain this record  (or specify `parent_zone_name`) | `string` | `""` | no |
| <a name="input_private_zone"></a> [private\_zone](#input\_private\_zone) | Is this a private hosted zone? | `bool` | `false` | no |
| <a name="input_target_dns_name"></a> [target\_dns\_name](#input\_target\_dns\_name) | DNS name of target resource (e.g. ALB, ELB) | `string` | n/a | yes |
| <a name="input_target_zone_id"></a> [target\_zone\_id](#input\_target\_zone\_id) | ID of target resource (e.g. ALB, ELB) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostnames"></a> [hostnames](#output\_hostnames) | List of DNS records |
| <a name="output_parent_zone_id"></a> [parent\_zone\_id](#output\_parent\_zone\_id) | ID of the hosted zone to contain the records |
| <a name="output_parent_zone_name"></a> [parent\_zone\_name](#output\_parent\_zone\_name) | Name of the hosted zone to contain the records |
