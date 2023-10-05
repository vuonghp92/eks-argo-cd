## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| dns | ./dns |  |
| dynamic_subnets | cloudposse/dynamic-subnets/aws | 0.39.5 |
| name_generator | ../name-generator |  |
| vpc | cloudposse/vpc/aws | 0.27.0 |
| vpc_endpoints | cloudposse/vpc/aws//modules/vpc-endpoints | 0.27.0 |

## Resources

| Name |
|------|
| [aws_vpc_endpoint_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azs | The AWS availability zones to deploy environment `ap-northeast-1a` | `list(string)` | n/a | yes |
| cidr | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | n/a | yes |
| environment | Environment to attach to resources | `string` | n/a | yes |
| internal\_domain | An internal DNS domain name to use for mapping IP addresses | `string` | n/a | yes |
| name | A short name to attach to resources | `string` | n/a | yes |
| region | AWS Region to attach to resources | `string` | n/a | yes |
| service | service of network | `string` | n/a | yes |
| tags | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| gateway\_vpc\_endpoints | List of Gateway VPC Endpoints deployed to the VPC. |
| network\_cidr | Network CIDR address space. |
| network\_dns\_zone\_id | The VPC network DNS ID. |
| network\_id | The VPC network ID. |
| network\_name | Short name to identify environment. |
| network\_private\_subnet\_cidrs | CIDR blocks of the created private subnets |
| network\_private\_subnet\_ids | n/a |
| network\_public\_subnet\_cidrs | CIDR blocks of the created public subnets |
| network\_public\_subnet\_ids | n/a |
