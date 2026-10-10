output "vpc_id" {
  value = aws_vpc.day2-vpc.id
  
}

output "subnet_id" {
  value = aws_subnet.day2-subnet.id
}
