variable "vpc_cidr" {
  description = "The CIDR value for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR value for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

