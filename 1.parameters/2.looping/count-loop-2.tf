
locals {
  names2 = ["name1", "name2", "name3"]
}


resource "null_resource" "count-2" {
  count = length(local.names2)

  triggers = {
    name = local.names2[count.index]
  }

  provisioner "local-exec" {
    command = "echo ${local.names2[index(local.names2, "name1")]}"
  }
}
