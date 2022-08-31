/*
* In this study case we are trying to perform terraform actions from terraform cloud + local files 
* 
* please before run this project ensure login into terraform cloud by runnning 
*    <terraform login>
*
*/

terraform {
  cloud {
    organization = "bpisoac"

    workspaces {
      name = "remote-operations"
    }
  }
}