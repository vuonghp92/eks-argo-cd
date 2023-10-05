## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment this Route 53 zone belongs to | `string` | n/a | yes |
| internal\_domain | Abbreviation of the product domain this Route 53 zone belongs to | `string` | n/a | yes |
| name | Name of the hosted zone | `string` | n/a | yes |
| service | service of the hosted zone | `string` | n/a | yes |
| tags | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| vpc\_id | VPC ID that will be associated with this hosted zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| zone\_id | The hosted zone id |
