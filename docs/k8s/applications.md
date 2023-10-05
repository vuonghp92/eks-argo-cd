# applications
* The `k8s` of manifest for server.
* The actual apply is done by `ArgoCD`.

## Prerequisites
* [Kustomize](https://github.com/helm/helm)

## Usage
```
$ kustomize build k8s/applications/${service}/overlays/${ENV}
```

## Description

### base
* The manifest template.
#### deployment.yaml
* manifest for deployment.

#### migration-job.yaml
* Job to execute database migration.
* To be executed before applying the `deployment`.
``` yaml
argocd.argoproj.io/hook: PreSync
argocd.argoproj.io/hook-delete-policy: HookSucceeded
argocd.argoproj.io/sync-wave: "2"
```

#### service-account.yaml
* Service account for `Pod`.
* Configuration that is connected to AWS IAM.
``` yaml
annotations:
  eks.amazonaws.com/role-arn: arn:aws:iam::<ACCOUNT_ID>:role/backend-api-eks-role
```

#### service.yaml
* manifest for service.
