# this is a built-in variable
output "workspace" {
  value = terraform.workspace
}

# switch config based on workspace
variable "general-config" {
  type = map(object({
    name = string
  }))

  default = {
    default = {
      name = "test"
    }
    dev = {
      name = "dev"
    }
    prod = {
      name = "prod"
    }
  }
}

resource "null_resource" "workspace-example" {
  triggers = var.general-config[terraform.workspace]

  provisioner "local-exec" {
    command = "echo ${var.general-config[terraform.workspace].name}"
  }
}

