variable def-tags {
    type = map
    default =  {
    env = "lab-8"
    author = "AndresCarrillo"
  }
}

variable "list" {
    type = list
    default = ["m5.large","m5.xlarge","t2.medium"]
}

variable "instanceType" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
    ap-south-1 = "t2.small"
  }
}

#la siguiente variable es solo para probar
variable "nombresIAMUsers" {
  type = list
  default = ["Martin","Alejandro","Carrillo"]
  
}