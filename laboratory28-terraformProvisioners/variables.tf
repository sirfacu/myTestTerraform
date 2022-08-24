variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-28"
    author = "AndresCarrillo"
    studyCase = "Provisioners"
  }
}

variable "instanceType"{
  type = string
  default = "t2.micro"
}

variable "myIP" {
  type = string
  default = "181.237.59.20/32"
}

variable "sgname" {
  type = string
  default = "lab28-SGforMyEC2instance"
  
}

/*


  tags = merge("${var.def-tags}",{Name="lab28-terraformProvisioners"})


*/
