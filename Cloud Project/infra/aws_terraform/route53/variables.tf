variable "fe_dns_name" {
  type        = string
  description = "DNS name of your frontend app"
}

variable "be_dns_name" {
  type        = string
  description = "DNS name of your backend app"
}

variable "load_balancer_dns_hostname" {
  type        = string
  description = "DNS name of your load balancer"
}

variable "aws_route53_zone_id" {
  type        = string
  description = "AWS Route53 zone id of where your domain is located"
  default     = "Z04725526PRIRPBVALEQ"
}

