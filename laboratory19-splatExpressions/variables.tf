variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-19"
    author = "AndresCarrillo"
  }
}

/*


tags = merge("${var.def-tags}",{Name="lab18-instance"})


*/