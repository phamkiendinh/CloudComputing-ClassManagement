variable "read_write_access_user" {
  type        = string
  description = "The user that have read write access to this repo"
  default     = "arn:aws:iam::201118949681:user/admin"
}
