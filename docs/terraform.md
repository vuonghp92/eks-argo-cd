# terraform
* Source code for terraform to build EKS for Workload, Aurora as storage, etc..

## Usage
```
$ ENV=<dev, stg etc> make plan
$ ENV=<dev, stg etc> make apply
```

## Description

### Root tf files

#### terraform/aws/dns.tf
* Configuration of `route53`.

#### terraform/aws/ecr.tf
* Configuration of `Elastic Container Registry`.

#### terraform/aws/iam_role_server.tf
* Configuration of the IAM Role associated with the pod of k8s running each module.

#### terraform/aws/iam_role_system_component.tf
* Configuration of the IAM Role associated with the `pod` of k8s running each system component.


#### terraform/aws/locals.tf
* List of local variables.

#### terraform/aws/main.tf
* Caller of the module you are using.

#### terraform/aws/outputs.tf
* List of outputs.

#### terraform/aws/providers.tf
* Configuration of providers.

#### terraform/aws/variables.tf
* List of variables.

### modules
#### acm
* Configuration of AWS Certificate Manager.
* Issue certificates to be set in `ALB`

#### aurora-postgres
* Configuration of Aurora PostgreSQL.

#### eks
* Configuration of Elastic Kuberenetes Service.

#### eks-alb
* Configuration of `ALB`, which is an resource associated with target group binding used in EKS.

#### eks-iam-role-with-oidc
* Creates single IAM role which can be assumed by trusted resources using OpenID Connect Federated Users.
* This module supports IAM Roles for kubernetes service accounts as described in the [EKS documentation](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).

#### name-generator
* Terraform module for generating common names

#### network
* Configuration of VPC Network.

#### route-53-alias-record
* Terraform module that implements "vanity" host names as `ALIAS` records to another Route53 DNS resource record (e.g. ELB/ALB, S3 Bucket Endpoint or CloudFront Distribution).
