variable "def-tags" {
  type = map(any)
  default = {
    author    = "Ing. Andres Carrillo"
    studyCase = "remoteOperations-terraformCloud"
  }
}




/*
  tags = merge("${var.def-tags}",{Name="lab54-remoteOperations-terraformCloud"})
*/

