//Create a VPC
resource "aws_vpc" "java-vpc" {
    cidr_block = var.cidr_blocks[0]
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name: "${var.env_prefix}-vpc"
    }
}