terraform {
  backend "s3" {
    bucket = "terraform-state-file-buckettt"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}