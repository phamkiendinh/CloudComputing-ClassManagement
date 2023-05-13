module "cert_manager" {
  source  = "terraform-iaac/cert-manager/kubernetes"
  version = "2.5.1"

  cluster_issuer_email                   = "nca.minh8897@gmail.com"
  cluster_issuer_name                    = "cert-manager-global"
  cluster_issuer_private_key_secret_name = "cert-manager-private-key"

}
