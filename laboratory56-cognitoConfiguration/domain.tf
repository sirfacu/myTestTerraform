resource "aws_cognito_user_pool_domain" "domain" {
  count           = !var.enabled || var.domain == null || var.domain == "" ? 0 : 1
  domain          = var.domain
  certificate_arn = var.domain_certificate_arn
  user_pool_id    = aws_cognito_user_pool.pool[0].id
}

data "aws_route53_zone" "zoneCognito" {
    name = var.main_domain
}

resource "aws_route53_record" "myCognitodns" {
  count  = !var.enabled || var.domain == null || var.domain == "" ? 0 : 1
  zone_id = data.aws_route53_zone.zoneCognito.zone_id
  name    = var.domain == null ? var.nombre-proyecto : var.domain
  type    = "CNAME"
  ttl     = "300"
  records = [ "${aws_cognito_user_pool_domain.domain[count.index].cloudfront_distribution_arn}" ]
  
}