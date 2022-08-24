variable "def-tags" {
  type = map(any)
  default = {
    author    = "Ing. Andres Carrillo"
    studyCase = "Locals+Modules"
  }
}
variable "instanceType" {
  type    = string
  default = "t2.micro"
}
variable "myIP" {
  default = "181.237.59.20/32"
}
variable "sgname" {
  type    = string
  default = "sg_for_ec2Instance"
}
variable "sgnameELB" {
  type    = string
  default = "sg_for_ELB"
}
variable "ssh_key_name" {
  type    = string
  default = "terraform-key"
}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22]
}
variable "sg_ports_outbound" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80,443]
}
/*

as I use these as local variables, are not longer 
neccesary these within my variables.tf file

variable "ingressPortEC2" {
  type        = string
  description = "list of ingress ports"
  default     = "8443"
}
variable "ingressPortELB" {
  type        = string
  description = "list of ingress ports"
  default     = "8443"
}
*/

/*


  tags = merge("${var.def-tags}",{Name="lab36-Locals+Modules"})


*/

