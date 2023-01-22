
data "terraform_remote_state" "project-2" {
  backend = "local"
  config = {
    path = "../project-1/terraform.tfstate"
  }
}

variable "output-project-2" {
  default = "value defined in project-2"
}
output "output-project-2" {
  value = var.output-project-2
}

resource "null_resource" "multi-state" {
  triggers = {
    output-project-2 = var.output-project-2
  }

  provisioner "local-exec" {
    command = "echo This is the local exec inside project 1, this is var from project-1 ${var.output-project-2} and this is var from project-1:" #${data.terraform_remote_state.project-2.outputs.output-project-1}"
  }
}
