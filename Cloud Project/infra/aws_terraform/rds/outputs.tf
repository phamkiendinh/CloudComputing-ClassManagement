output "rds_host_address" {
  value = module.rds.db_instance_address
}

output "rds_db_name" {
  value = module.rds.db_instance_name
}

output "rds_db_port" {
  value = module.rds.db_instance_port
}

# output "rds_db_username" {
#   value = module.rds.db_instance_username
# }

# output "rds_db_password" {
#   value = module.rds.db_instance_password
# }
