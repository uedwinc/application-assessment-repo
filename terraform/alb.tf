# Define Load Balancer
resource "aws_lb" "java-lb" {
  name               = "java-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = [aws_subnet.public_subnet.id,aws_subnet.private_subnet.id]
}