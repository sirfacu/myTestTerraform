/*
  to use s3 as backend do you need add also a dynamoBD to avoid corrupt your tfstate because s3 by default
  doesn't support state locking feature from terraform
  so, just we need add the variable dynamo_table = "name_table" to achieve this correctly
  well we also need go to dynamoDB on AWS and create the table and set as partition key lockID

*/
terraform {
  backend "s3" {
    bucket = "terraform-labs-sirfacu"
    key = "tfstate-files/lab45"
    dynamodb_table = "lab45table"
    region = "us-east-1"
    profile = "sirfacu"  # I need to add this varible because I use different profiles to work instead use default
  }
}
resource "time_sleep" "morpheus" {
    create_duration = "300s"
}

