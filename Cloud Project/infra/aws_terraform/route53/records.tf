resource "aws_route53_record" "fe_record" {
  zone_id = var.aws_route53_zone_id
  name    = var.fe_dns_name
  type    = "CNAME"
  ttl     = "100"
  records = [var.load_balancer_dns_hostname]
}

resource "aws_route53_record" "be_record" {
  zone_id = var.aws_route53_zone_id
  name    = var.be_dns_name
  type    = "CNAME"
  ttl     = "100"
  records = [var.load_balancer_dns_hostname]
}
