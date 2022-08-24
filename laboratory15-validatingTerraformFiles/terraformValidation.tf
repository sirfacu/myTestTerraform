# basically we use the <terraform validate> command to validate sintactically a configuration file
# you must use <terraform init> comamand before run <terraform validate> command
provider "aws" {
  region  = "us-west-2"
  profile = "sirfacu"
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = "t2.micro"
  tags          = merge("${var.def-tags}", { Name = "lab12-instance" })
  sky = "blue" /*this argument doesn't a valid variable because it doesn't exist or was declared before so when 
                we run a terraform validate it will show an message error as below:


                │ Error: Reference to undeclared resource
                │ 
                │   on terraformValidation.tf line 8, in resource "aws_instance" "my_ec2":
                │    8:   ami           = data.aws_ami.dataAmiId.id
                │ 
                │ A data resource "aws_ami" "dataAmiId" has not been declared in the root module.
                ╵


                */
 }
