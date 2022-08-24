provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}
/*
resource "aws_instance" "lab8-ec2-instance" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = var.instanceType["us-west-2"] #instanciando valores por referencia de llave en el map
  #instance_type = var.instanceType[0] #instanciando por indices en un list
  tags = var.def-tags
  count = 1 # este valor permite crear multiples la cantidad indicada de este recurso en este caso creara 5 instancias
}*/

#In the next block we try create 5 users using the count parameter but the name will be the same, so we will practice how to avoid that behavior using count.index that will let us handle separately each IAM user 
resource "aws_iam_user" "lb" {
  #name = "loadbalancer.${count.index}"
  name = var.nombresIAMUsers[count.index] #Este ejemplo lo cree para ver si era posible usarlo con un list de nombres
  count = 3
  path = "/system/"
}