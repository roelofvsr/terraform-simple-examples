
module "remote-module-https" {
  source = "github.com/roelofvsr/terraform-examples//3.dev/2.remote-modules/modules/module-1?ref=dev"
  input  = "remote-module-https"
}

# for remote modules in a private repo authenticate with SSH
module "remote-module-ssh" {
  source = "git@github.com:roelofvsr/terraform-examples.git//3.dev/2.remote-modules/modules/module-1?ref=dev"
  input  = "remote-module-ssh"
}

# this can locally be come binded with a simple ssh config in order to set the correct ssh-key. 
# for github action you can use a deploy key in order to reach a private repo. 

