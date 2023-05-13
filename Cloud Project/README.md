# Provision infra

## Terraform

References:

1. [Provision EKS, Cluster Autoscaler, AWS Load Balancer controller](https://antonputra.com/amazon/create-eks-cluster-using-terraform-modules/#add-iam-user-role-to-eks)
2. [Using AWS EKS blueprint](https://aws-ia.github.io/terraform-aws-eks-blueprints/v4.29.0/)

Notes:
- When destroy infra remember to go to AWS console and delete load balancer for the terraform to successfully destroy(Only when using AWS Load Balancer Controller)

## Destroy infra
- Go to infra from root folder
```
cd infra  && bash -x destroy_infra.sh
```

Kubernetes production example by @BugFixWanderer