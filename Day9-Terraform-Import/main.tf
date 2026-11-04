resource "aws_instance" "import" {
  ami = "ami-0c230065b91270bc6"
  instance_type = "t3.micro"
  tags = {
    Name = "Change from Terraform"
  }
}

resource "aws_s3_bucket" "import" {
  bucket = "terraform-importttt-pracccc"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.import.id
  versioning_configuration {
    status = "Enabled"
  }
}





#   terraform import aws_instance.name instance_id  =  To Import existing AWS EC2 instance into Terraform state file
#   terraform import aws_s3_bucket.name bucket_name  =  To Import existing AWS S3 bucket into Terraform state file