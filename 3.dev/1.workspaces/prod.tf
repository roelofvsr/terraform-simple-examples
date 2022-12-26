# switch config based on workspace
locals {
  production = {
    number-of-nodes = 3
    tags = {
      environment = "production"
    }
  }
}

# this is a built-in variable
output "workspace" {
  value = terraform.workspace
}

# get the number of nodes from the local map dependening on the workspace
output "number-of-nodes" {
  value = local.environment
}

variable "environment" {
  default = "production"
}

# hmm this does not work yet: see:
#https://binx.io/nl/2021/06/11/how-to-use-terraform-workspaces-to-manage-environment-based-configuration/

# usually you would split config into multiple files
# this way you can set a specific environment locally
