module "ecr_fe_public" {
  source          = "terraform-aws-modules/ecr/aws"
  version         = "1.6.0"
  repository_name = "cloud-computing/fe"
  repository_type = "public"

  repository_read_write_access_arns = [var.read_write_access_user]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  public_repository_catalog_data = {
    description       = "Docker container for cloud computing fe"
    about_text        = ""
    usage_text        = ""
    operating_systems = ["Linux"]
    architectures     = ["x86"]
    # logo_image_blob   = filebase64("${path.module}/files/clowd.png")
  }

  tags = {
    Terraform   = "true",
    Project     = "cloud-computing",
    Environment = "production",
  }
}
