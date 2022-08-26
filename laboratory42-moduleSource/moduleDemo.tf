module "remoteDemo" {
    source = "git::git@github.com:sirfacu/terraformStudy-moduleSource.git?"
    #source = "git::git@github.com:sirfacu/terraformStudy-moduleSource.git?ref=development" #using ref to call a different branch from main
  
}