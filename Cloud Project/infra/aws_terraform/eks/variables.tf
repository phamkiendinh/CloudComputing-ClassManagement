variable "ec2_instance_type" {
  type        = string
  description = "The AWS Compute Engine type to use"
  default     = "t3.micro"
}

variable "aws_region" {}
variable "aws_profile" {}
