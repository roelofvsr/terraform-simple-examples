# # switch config based on workspace
# locals {
#   development = {
#     number-of-nodes = 1
#     tags = {
#       environment = "development"
#     }
#   }
# }

# # this is a built-in variable
# output "workspace" {
#   value = terraform.workspace
# }

# # get the number of nodes from the local map dependening on the workspace
# output "number-of-nodes" {
#   value = local.development.number-of-nodes
# }

# # usually you would split config into multiple files
# # this way you can set a specific environment locally

