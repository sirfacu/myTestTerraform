variable "iam_user" {
  default = "demouser"
}

variable def-tags {
    type = map
    default =  {
    env = "lab-16"
    author = "AndresCarrillo"
  }
}