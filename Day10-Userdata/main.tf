resource "aws_instance" "name" {
    ami = "ami-002192a70217ac181"
    instance_type = "t3.micro"
    user_data = file("userdata.sh")
    tags = {
        Name = "dev"
    }
  
}