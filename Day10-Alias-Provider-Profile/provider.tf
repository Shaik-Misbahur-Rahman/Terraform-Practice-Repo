provider "aws" {
  region = "us-east-1"
  profile = "default"
}

provider "aws" {
  alias = "oregon"
  region = "us-west-2"
  profile = "dev"

}