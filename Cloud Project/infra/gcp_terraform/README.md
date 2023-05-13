# How to run GCP GKE infra

- Make sure complete these step before terraform apply

```
terraform init
```

- Enable compute engine api and container api

```
gcloud init
```

```
gcloud auth application-default login
```

- To output service account key or go to base64 decode online, and copy that json to Github action

```
terraform output kubernetes-service-account-secret-key | base64 -d -
```
