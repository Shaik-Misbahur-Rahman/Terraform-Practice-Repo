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