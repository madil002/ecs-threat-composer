output "lb_target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "lb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "lb_dns_name" {
  value = aws_lb.main.dns_name
}

output "lb_zone_id" {
  value = aws_lb.main.zone_id
}
