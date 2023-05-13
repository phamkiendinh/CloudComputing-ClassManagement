variable "project" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "elliptical-feat-385302"
}

variable "name" {
  description = "name of the kubernetes cluster"
  type        = string
  default     = "minh-gke"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "europe-west6"
}


variable "location" {
  description = "location for k8s cluster"
  type        = string
  default     = "europe-west6-a"
}

variable "nodecount" {
  description = "number of nodes"
  type        = number
  default     = 2
}

variable "nodetype" {
  description = "type of nodes"
  type        = string
  # default     = "n1-standard-1"
  default = "e2-small"
}

variable "whitelist-ips" {
  description = "ip's allowed to access k8s controlplane"
  type        = list(string)
  default     = ["0.0.0.0/32"]
}

# //
# variable "service-account-id" {
#   description = "The ID of service account of GCP"
#   default     = "serviceaccount-id"
# }

# variable "minnode" {
#   description = "Minimum number of node pool"
#   default     = 2
# }
# variable "maxnode" {
#   description = "Maximum number of node pool"
#   default     = 2
# }

variable "disksize" {
  description = "Disk Size in GB"
  default     = 10
}
