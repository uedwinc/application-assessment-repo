# Define Auto Scaling Group
resource "aws_autoscaling_group" "java-asg" {
  name                 = "java-asg"
  target_group_arns = [aws_lb_target_group.java-target-group.arn]
  health_check_type = "EC2"
  vpc_zone_identifier = [aws_subnet.private_subnet.id,aws_subnet.public_subnet.id]

  // Define launch template for Docker hosts
  launch_template {
    id      = aws_launch_template.java-template.id
    version = aws_launch_template.java-template.latest_version
  }

  // Define minimum, maximum, and desired capacity
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
}
