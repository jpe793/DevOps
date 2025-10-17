#!/usr/bin/env bash
set -euo pipefail
NAMESPACE=${K8S_NAMESPACE:-demo}
IMAGE=${IMAGE:-docker.io/tu_usuario/flask-cicd:dev}
kubectl create ns "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -
sed "s|IMAGE_PLACEHOLDER|$IMAGE|g" k8s/deployment.yaml | kubectl -n "$NAMESPACE" apply -f -
kubectl -n "$NAMESPACE" apply -f k8s/service.yaml
kubectl -n "$NAMESPACE" rollout status deployment/flask-app --timeout=120s
