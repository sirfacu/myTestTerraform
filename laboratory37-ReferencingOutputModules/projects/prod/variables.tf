variable "def-tags" {
  type = map(any)
  default = {
    author    = "Ing. Andres Carrillo"
    studyCase = "Modules+outputs"
  }
}
variable "instanceType" {
  type    = string
  default = "t2.micro"
}

/*


  tags = merge("${var.def-tags}",{Name="lab37-modules+outputs"})


*/

