
resource "aws_security_group" "devops-project" {
  name        = "devops-project"
  description = "Allow different CIDR inbound traffic"

  
ingress = [
  for rule in [
    {
      port = 22
      cidr = "103.25.10.5/32"
    },
    {
      port = 80
      cidr = "0.0.0.0/0"
    },
    {
      port = 443
      cidr = "0.0.0.0/0"
    },
    {
      port = 5000
      cidr = "10.0.2.0/24"
    },
    {
      port = 3306
      cidr = "10.0.3.0/24"
    }
  ] : {
    description      = "Different CIDR rules"
    from_port        = rule.port
    to_port          = rule.port
    protocol         = "tcp"
    cidr_blocks      = [rule.cidr]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }
]


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
