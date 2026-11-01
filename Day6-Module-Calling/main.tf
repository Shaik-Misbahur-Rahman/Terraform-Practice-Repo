module "dev" {
  source = "../Day6-Modules"
  ami_id = "ami-041607313c6a2a618"
  instance_type = "t3.micro"
}
