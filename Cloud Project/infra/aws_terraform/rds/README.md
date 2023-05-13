# How to get the password
```
terraform state pull | jq -r '.resources[] | select(.module == "module.rds.module.rds.module.db_instance") | .instances[0].attributes.password | select (.!=null)'
```