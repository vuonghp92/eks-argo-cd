#!/usr/bin/env bash

set -eo pipefail

namespace=${1}
target_group_arn=${2}
alb_security_group_id=${3}

if [ "$#" -ne 3 ]; then
  echo "usage: init.sh [namespace] [target_group_arn] [alb_security_group_id]"
  exit 1
fi

cat <<EOF | kubectl create -f - || true
apiVersion: elbv2.k8s.aws/v1alpha1
kind: TargetGroupBinding
metadata:
  name: argo-cd-tgb
  namespace: ${namespace}
spec:
  serviceRef:
    name: "argo-cd-argocd-server"
    port: 80
  targetGroupARN: ${target_group_arn}
  targetType: ip
  networking:
    ingress:
    - from:
      - securityGroup:
          groupID: ${alb_security_group_id}
      ports:
      - protocol: TCP
EOF
