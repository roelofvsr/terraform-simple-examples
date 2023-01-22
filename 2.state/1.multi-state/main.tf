

resource "null_resource" "multi-state" {
  triggers = {
    module-1 = "module-1"
  }

  provisioner "local-exec" {
    command = "echo This terraform code is initiated with a config for: ${var.env} environment"
  }
}

#
# tf plan -var-file=./config/dev.tfvars
# tf plan -var-file=./config/acc.tfvars
# tf plan -var-file=./config/prod.tfvars

