//Create a custom route table and associate it with the VPC
resource "aws_route_table" "java-route-table" {
  vpc_id = aws_vpc.java-vpc.id
  tags = {
    Name: "${var.env_prefix}-rtb"
  }
}

//Associate subnet-1 to the custom route table
resource "aws_route_table_association" "rtb-subnet-1" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.java-route-table.id
}

//Associate subnet-2 to the custom route table
resource "aws_route_table_association" "rtb-subnet-2" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.java-route-table.id
}

//Create a route to the internet gateway for custom route table
resource "aws_route" "java-rtb-igw" {
  route_table_id = aws_route_table.java-route-table.id
  destination_cidr_block = var.default_route
  gateway_id = aws_internet_gateway.java-igw.id
}