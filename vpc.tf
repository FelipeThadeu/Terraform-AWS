#Creating VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

#Creating Private Subnet 1
resource "aws_subnet" "main-private-1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags {
    Name = "Main_Private_1"
  }
}

#Creating Private Subnet 2
resource "aws_subnet" "main-private-2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags {
    Name = "Main_Private_2"
  }
}

#Creating Public Subnet 1
resource "aws_subnet" "main-public-1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags {
    Name = "Main_Public_1"
  }
}

#Creating Public Subnet 2
resource "aws_subnet" "main-public-2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags {
    Name = "Main_Public_2"
  }
}

#Creating Internet Gateway
resource "aws_internet_gateway" "igw-main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "igw-main"
  }
}

#Creating Route Table
resource "aws_route_table" "main-route-table" {
  vpc_id = "${aws_vpc.main.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw-main.id}"
  }
  tags = {
    Name = "main"
  }
}

#Creating Route
resource "aws_route" "main-route" {
  route_table_id            = "${aws_route_table.r.id}"
  destination_cidr_block    = "10.0.0.0/16"
}

#Association route
resource "aws_route_table_association" "main" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-route-table.id}"
}

#Association route
resource "aws_route_table_association" "main" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-route-table.id}"
}


#Creating Security Group
resource "aws_security_group" "main-sg" {

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80    
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}



#Creating Endpoint
#resource "aws_vpc_endpoint" "s3" {
#  vpc_id       = "${aws_vpc.main.id}"
#  service_name = "com.amazonaws.us-east-1.s3"
#}
