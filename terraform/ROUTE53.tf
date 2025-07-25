resource "aws_route53_zone" "primary" {
  name = "app.madil.co.uk"
}

# Hardcode good for reusablity?

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}
