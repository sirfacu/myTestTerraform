/*
  for each makes use of map/set as an index value of the created resources
  the object within each object are
   each.key = The map key corresponding to this instance
   each.value = tha map value corresponding to this instance
*/


/* #example 01
resource "aws_iam_user" "myIAMusers" {
  #for_each = toset( ["user-0","user-01","user-02","user-03","user-04"] )
  for_each = toset( var.iam_names )
  name     = each.key
  tags = merge("${var.def-tags}",{Name="lab27-for_each"})
} */# finish example 01


data "aws_ami" "dataAmiId" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.dataAmiId.id
  for_each ={
      key1 = "t2.micro"
      key2 = "t2.medium"
   }
  instance_type = each.value
  key_name = each.key
  tags          = merge("${var.def-tags}", {Name=each.value} ,{tagging="lab27-for_each-instance"})
  
}