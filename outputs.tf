
output "elb_dnspub_name" {
  value = aws_lb.application_lb.dns_name
}

