variable "region" {
  default = "us-west-2"
}

variable "tags" {
  type = list
  default = ["instancia1","instancia2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-098e42ae54c764c35"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}