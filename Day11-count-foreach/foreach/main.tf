variable "foreach" {
  type = list(string)
  default = ["dev", "test", "prod"]
}



resource "aws_instance" "name" {
    ami = "ami-0d27e0fb3bac4d724"
    instance_type = "t2.medium"
    for_each=toset(var.foreach)
    tags = {
        Name = each.key
    }

  
}