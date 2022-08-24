variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-18"
    author = "AndresCarrillo"
  }
}

/*


tags = merge("${var.def-tags}",{Name="lab18-instance"})


*/