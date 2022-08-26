variable "def-tags" {
  type = map(any)
  default = {
    author    = "Ing. Andres Carrillo"
    studyCase = "Workspaces"
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

variable "dbstorageType" {
  type = string
  default = "gp2"
}
variable "dbEngine" {
  type = string
  default = "mysql"
}
variable "dbEngineVersion" {
  type = string
  default = "5.7"
}
# I configure all values with us-east-1 to avoid additional charges on my aws account
variable "instanceType" {
  type    = map
  default = {
    default = "db.t2.micro"
    dev     = "db.t2.micro"
    prod    = "db.t2.micro"
  }
}
variable "dbName" {
  type = string
  default = "dbfoo"
}
variable "dbuser" {
  type = string
  default = "foo"
}

/*


  tags = merge("${var.def-tags}",{Name="lab40-Workspaces"})


*/

