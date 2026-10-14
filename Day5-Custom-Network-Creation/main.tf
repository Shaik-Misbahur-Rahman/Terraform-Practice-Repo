resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform-practice-vpc"
  }
}

resource "aws_subnet" "dev_public_subnet" {
    vpc_id            = aws_vpc.dev_vpc.id
    tags = {
        Name = "terraform-public-subnet"
    }
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "dev_private_subnet" {
    vpc_id            = aws_vpc.dev_vpc.id
    tags = {
        Name = "terraform-private-subnet"
    }
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "dev_igw" {
    vpc_id = aws_vpc.dev_vpc.id
    tags = {
        Name = "terraform-practice-igw"
    }
}

resource "aws_nat_gateway" "dev_nat" {
  allocation_id = aws_eip.dev_nat_eip.id
  subnet_id     = aws_subnet.dev_public_subnet.id
  tags = {
    Name = "terraform-practice-nat"
  }
}

resource "aws_eip" "dev_nat_eip" {
  domain = "vpc"
  tags = {
    Name = "terraform-practice-nat-eip"
  }
}

resource "aws_route_table" "dev_public_rt" {
    tags = {
        Name = "terraform-public-rt"
    }
  vpc_id = aws_vpc.dev_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_igw.id
    }
}

resource "aws_route_table" "dev_private_rt" {
    tags = {
        Name = "terraform-private-rt"
    }
  vpc_id = aws_vpc.dev_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.dev_nat.id
    }
}

resource "aws_route_table_association" "dev_public_rt_assoc" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

resource "aws_route_table_association" "dev_private_rt_assoc" {
  subnet_id      = aws_subnet.dev_private_subnet.id
  route_table_id = aws_route_table.dev_private_rt.id
}

resource "aws_security_group" "dev_sg" {
    tags = {
        Name = "terraform-practice-sg"
    }
  name        = "terraform-practice-sg"
  description = "Security group for Terraform practice"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}   

resource "aws_instance" "dev_instance" {
  ami           = "ami-004d1eaf8eaa0107d"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.dev_private_subnet.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  tags = {
    Name = "terraform-private-instance"
  }
}