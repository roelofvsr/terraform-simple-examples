variable "output-project-1" {
  default = "value defined in project-1"
}
output "output-project-1" {
  value = var.output-project-1
}

resource "null_resource" "multi-state" {
  triggers = {
    output-project-1 = var.output-project-1
  }

  provisioner "local-exec" {
    command = "echo This is the local exec inside project 1 and only echos local vars: ${var.output-project-1} "
  }
}



# optional: read state back in from project-2
data "terraform_remote_state" "project-2" {
  backend = "local"
  config = {
    path = "../project-2/terraform.tfstate"
  }
}

resource "null_resource" "multi-state-read-back-in" {
  triggers = {
    output-project-1 = var.output-project-1
  }

  provisioner "local-exec" {
    command = "echo This is the local exec inside project 1, this is var from project-1 ${var.output-project-1} and this is var from project-2: ${data.terraform_remote_state.project-2.outputs.output-project-2}"
  }
}

