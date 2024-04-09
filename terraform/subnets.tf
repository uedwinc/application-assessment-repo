//Create a public subnet and associate it with the VPC
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.java-vpc.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = var.avail_zone[0]
    map_public_ip_on_launch = true
    tags = {
      Name: "${var.env_prefix}-subnet-1"
    }
}

//Create a private subnet and associate it with the VPC
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.java-vpc.id
    cidr_block = var.cidr_blocks[2]
    availability_zone = var.avail_zone[1]
    tags = {
      Name: "${var.env_prefix}-subnet-2"
    }
}