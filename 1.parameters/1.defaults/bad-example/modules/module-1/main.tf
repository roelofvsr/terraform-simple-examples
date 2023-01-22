resource null_resource "example" {
    triggers = { parameter1 = var.parameter1}

     provisioner "local-exec" {
        command = "echo -e \"and ${var.parameter1} \n and ${var.parameter2} \n and ${var.parameter3} \n and ${var.parameter4} \n and ${var.parameter5} \n and ${var.parameter6} \n and ${var.parameter7} \n and ${var.parameter8} \n\""
     }
}
