/*
* there are many sub commands than could help us once you apply a configuration within your AWS account, 
* To use those commands you need to invoke terraform state below the way to usage:

    terraform state <subcommmand>

* LIST: This subcommand show a list with the resoruces name within your configuration already applied usage:

    terraform state list

* MV: This command is used to rename the resources without need to recreate the resource , due to destructive
* nature of this command will output a backup to save the original values. usage: 

    terraform state mv resource.resource_name_old resource.resource_name_newName
    ex:
    terraform state mv aws_instance.nginx aws_instance.myec2

* PULL: This sub command let us get information from the tfstate file from the remote source, usage:

    terraform state pull  

* PUSH: This sub command basically upload a tfstate file to a remote source or backend

* RM: This command let us remove from tfstate file a resource without remove it physically, just when you run a 
  tf apply or tf plan commands the output don't show you the resource, it's mean the resources are not longer management
  from TF once you run a rm subcommand, usage:

    terraform state rm resource.resourceName
    ex:
    terraform state rm aws_instance.myec2

* SHOW: This command show us the attribute from a specific resources, usage:

    terraform state show resource.resourceName
    ex:
    terraform state show aws_iam_user.lb
+
*/


data "aws_ami" "dataAmiId" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "nginx" {
  ami           = data.aws_ami.dataAmiId.id
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}