variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-25"
    author = "AndresCarrillo"
  }
}

variable "iam_names"{
  type = list
  default = ["user-00","user-01","user-02","user-03","user-04"]
}
/*


  tags = merge("${var.def-tags}",{Name="lab20-instance"})


*/
