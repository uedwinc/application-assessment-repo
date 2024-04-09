# Output Load Balancer DNS name
output "lb_dns" {
  value = aws_lb.java-lb.dns_name
}


output "region" {
  value = var.region
}