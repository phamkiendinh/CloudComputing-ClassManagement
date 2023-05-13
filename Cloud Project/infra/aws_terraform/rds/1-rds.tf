# Create RDS instance
################################################################################
# RDS Module
################################################################################
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.6.0"


  # identifier = "postgres-cloud-computing"
  # # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  # engine               = "postgres"
  # engine_version       = "14"
  # family               = "postgres14" # DB parameter group
  # major_engine_version = "14"         # DB option group
  # instance_class       = "db.t3.micro"

  identifier = "mysql-cloud-computing"
  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts
  engine               = "mysql"
  engine_version       = "8.0.26"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 20

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name  = "production"
  username = "mysqladmin"
  password = var.password
  # port     = 5432
  port     = 3306


  multi_az               = false
  vpc_security_group_ids = [module.security_group.security_group_id]

  publicly_accessible = true
  deletion_protection = false
  skip_final_snapshot = true # To delete rds without keep a snapshot

  tags = {
    Terraform   = "true",
    Project     = "cloud-computing",
    Environment = "production",
  }
}
