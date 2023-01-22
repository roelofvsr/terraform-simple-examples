resource "null_resource" "module-2" {
  triggers = {
    module-1 = "module-1"
  }

  provisioner "local-exec" {
    command = "echo ${var.input}"
  }
}

