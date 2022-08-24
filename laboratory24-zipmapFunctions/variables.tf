variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-24"
    author = "AndresCarrillo"
  }
}

/*


  tags = merge("${var.def-tags}",{Name="lab20-instance"})


*/
