#Creating EC2 Instance

#Server 1 Public Subnet 1
resource "aws_instance" "server1" {
    
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = ""
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-public-1.id}"

  tags {
    Name = "Server 1"
  }
}

#Server 2 Public Subnet 2
resource "aws_instance" "server2" {
    
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = ""
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-public-2.id}"

  tags {
    Name = "Server 2"
  }
}

#Server 3 Private Subnet 1
resource "aws_instance" "server3" {
    
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = ""
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-private-1.id}"

  tags {
    Name = "Server 3"
  }
}

#Server 4 Private Subnet 2
resource "aws_instance" "server4" {
    
  ami = "${var.ami}"
  instance_type = "t2.micro"
  key_name = ""
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.main-private-2.id}"

  tags {
    Name = "Server 4"
  }
}
