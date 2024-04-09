# Define target group
resource "aws_lb_target_group" "java-target-group" {
  name     = "java-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.java-vpc.id
  health_check {
    # interval = 70
    path = "/"
    # port = 80
    # healthy_threshold = 2
    # unhealthy_threshold = 2
    # timeout = 60
    # protocol = "HTTP"
    matcher = 200
  }
}

# Define listener
resource "aws_lb_listener" "java-listener" {
  load_balancer_arn = aws_lb.java-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.java-target-group.arn
  }
}