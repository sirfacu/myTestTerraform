variable "def-tags" {
  type = map(any)
  default = {
    author    = "Ing. Andres Carrillo"
    studyCase = "remoteBackends"
  }
}
# I configure all values with us-east-1 to avoid additional charges on my aws account
variable "deployRegion" {
    type    = map
    default = {
      default = "us-east-1"
      dev     = "us-east-1"
      prod    = "us-east-1"
  }
}



/*


  tags = merge("${var.def-tags}",{Name="lab43-remoteBackends"})


*/

