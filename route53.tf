resource "aws_route53_record" "alias_route53_to_elb" {
  zone_id = "Z0999433ZG0Q0Z7K66A7"
  name = "dellops.online"
  type = "A"

  alias {
    name = aws_lb.application_lb.dns_name
    zone_id = aws_lb.application_lb.zone_id
    evaluate_target_health = true
  }
}