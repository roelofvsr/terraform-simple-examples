
# default
resource "null_resource" "default" {
  triggers = { name = var.name }

  provisioner "local-exec" {
    command = "echo This is the default resource"
  }

}

# extra
resource "null_resource" "extra-storage" {
  count = var.config.extra-storage == true ? 1 : 0

  triggers = { name = var.st-name }

  provisioner "local-exec" {
    command = "echo This is the an additional resource"
  }
}

