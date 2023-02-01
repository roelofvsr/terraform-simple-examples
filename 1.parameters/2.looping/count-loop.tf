
locals {
  names = ["name1", "name2", "name3"]
}


resource "null_resource" "count" {
  count = length(local.names)

  triggers = {
    name = local.names[count.index]
  }

  provisioner "local-exec" {
    command = "echo ${local.names[count.index]}"
  }
}
