module "ec2module" {
  source = "../../modules/ec2"
  instanceType = "t2.large"
  ssh_key_name = "sirfacus"
  myIP = ["190.257.16.32/32"] # validate why the variable is failing 
}