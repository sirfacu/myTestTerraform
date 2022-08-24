variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-27"
    author = "AndresCarrillo"
  }
}

variable "iam_names"{
  type = list
  default = ["user-01","user-02","user-03","user-04"]
}
/*


  tags = merge("${var.def-tags}",{Name="lab26-dataTypeSET"})


*/
