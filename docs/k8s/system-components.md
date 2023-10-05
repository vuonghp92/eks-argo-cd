# system-components
* System components required for `k8s`

## Prerequisites
* [Helm](https://github.com/helm/helm)
* [Helmfile](https://github.com/roboll/helmfile)

## Usage
```
$ helmfile -e ${ENV} apply
```

## Description

### argocd
* Configuration of `helm` to deploy `argocd`, a `CD` for deploying.

#### `scripts/init.sh`
* Script for creating a `TargetGroupBinding` to bind an ALB to a `argocd` `service`. You need to deploy `aws-load-balancer-controller` in advance.

### argocd-notifications
* The component to hook and notify `argocd` events.

### autoscaler
* `cluster-autoscaler` is the component that scales out each node.
* Because `node group` is used, the max and min size should be set to a flexible size.

### aws-load-balancer-controller
* Provides an operator for `ALB ingress` and an operator for `TargetGroupBinding`

### descheduler
* The component that corrects biases in the placement of `Pod` nodes according to rules.

### external-dns
* The component that sets its own `annotation` for a `Service` and sets a record in a Route53 zone.

### external-secrets
* The component creates a secret from the `Secret manager` or `Parameter Store` using the configuration information in the `k8s manifest` created with its own `CRD`.

### metrics-server
* The component to be able to get metrics of cpu usage and memory usage as displayed by the `top` command.
