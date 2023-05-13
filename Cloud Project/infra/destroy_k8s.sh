#!/bin/bash
### ** Destroy K8s resources **
# define Kubernetes resources to delete
resources=("services" "deployments" "statefulsets" "configmaps" "secrets" "ingresses" "nodes" "pods")

# loop through resources and delete all instances
for resource in "${resources[@]}"; do
    kubectl delete --all $resource --ignore-not-found=true --grace-period=0
done

# delete remaining objects
kubectl api-resources --verbs=delete --namespaced=true --output name | xargs -n 1 kubectl delete --all --ignore-not-found=true --grace-period=0