resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}


resource "helm_release" "nginx_ingress_controller" {
  name          = "nginx-ingress-controller"
  force_update  = true
  repository    = "https://kubernetes.github.io/ingress-nginx"
  chart         = "ingress-nginx"
  namespace     = "ingress-nginx"
  version       = "4.6.0"
  recreate_pods = true
  reuse_values  = true

  depends_on = [
    kubernetes_namespace.ingress-nginx,
  ]

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
    value = "true"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-connection-draining-enabled"
    value = "true"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-connection-draining-timeout"
    value = "30"
  }

  set {
    name  = "controller.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "controller.replicaCount"
    value = "1"
  }
}


# Using to output load balancer dns hostname
data "kubernetes_service" "nginx_ingress_controller" {
  depends_on = [helm_release.nginx_ingress_controller]

  metadata {
    name      = "${helm_release.nginx_ingress_controller.metadata[0].name}-${helm_release.nginx_ingress_controller.namespace}-controller"
    namespace = helm_release.nginx_ingress_controller.metadata[0].namespace
  }
}

