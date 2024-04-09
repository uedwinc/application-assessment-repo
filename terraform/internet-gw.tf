//Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "java-igw" {
  vpc_id = aws_vpc.java-vpc.id
  tags = {
    Name: "${var.env_prefix}-igw"
  }
}