resource "aws_vpc" "day2-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-day2-vpc"
  }
  
}

resource "aws_subnet" "day2-subnet" {
  vpc_id = aws_vpc.day2-vpc.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "terraform-day2-subnet-1"
  }
  availability_zone = "us-east-1a"
}
