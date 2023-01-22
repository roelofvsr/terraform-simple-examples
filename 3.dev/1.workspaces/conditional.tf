
# Conditional resources based on workspace

# if terraform.workspace is "default" create 5 else 1
resource "null_resource" "workspace-example-count" {
  count = terraform.workspace == "default" ? 5 : 1
}

output "name" {
  value = terraform.workspace == "default" ? 5 : 1
}

