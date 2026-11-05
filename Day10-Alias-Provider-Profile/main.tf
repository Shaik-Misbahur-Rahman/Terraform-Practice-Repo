resource "aws_instance" "name" {
    ami = "ami-0c230065b91270bc6"
    instance_type = "t3.micro"
    availability_zone = "us-east-1a"
    tags = {
        Name = "alias-test"
    }

  
}

resource "aws_s3_bucket" "bucket" {
    bucket = "aliasss-testttt-buckeeeet"
    provider = aws.oregon

}