//Filter latest version of AMI
data "aws_ami" "latest-amazon-linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [var.image_name]
  }
}

# Define launch configuration
resource "aws_launch_template" "java-template" {
  name          = "java-launch-template"
  # ID of the Amazon Machine Image (AMI) to use for the instance
  image_id      = data.aws_ami.latest-amazon-linux.id
  instance_type = "t2.micro"

  network_interfaces {
    device_index = 0
    security_groups = [aws_security_group.asg-security-group.id]
  }

  // Define user data script to install Docker and start Docker service
  user_data = filebase64("docker-script.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "java"
    }
  }
}