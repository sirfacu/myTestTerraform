/*
* in this file I want to show you the different ways to configure different sources within module definition 
* are many sources as: 
* local paths
* Terraform registry
* Github
* Bitbucket
* Generic Git, Mercurial
* http urls
* S3 buckets
* GCS buckets
*/


#local paths
module "localPaths" {
  source = "../path/to/module"
}

module "git https"{
  source = "git::https://example.com/vpc.git"
}

module "git ssh" {
  source = "git::ssh://username@example.com/storage.git"
}

# by default git uses the default branch in the repository referenced so we can change it using ref argument at the end of the URL
module "git different branch" {
  source = "git::ssh://username@example.com/storage.git?ref=branch_name"
}

#For more examples please refer to https://www.terraform.io/language/modules/sources