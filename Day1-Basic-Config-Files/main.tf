resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test-vpc"
  }
  region = "us-east-1"

}







#Here VPC Cloud reference name is test-vpc
#Here Resource Local reference name is test