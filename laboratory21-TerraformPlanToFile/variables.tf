variable "def-tags" {
  type = map(any)
  default = {
    env    = "lab-21"
    author = "AndresCarrillo"
  }
}

/*


tags = merge("${var.def-tags}",{Name="lab21-instance"})


*/