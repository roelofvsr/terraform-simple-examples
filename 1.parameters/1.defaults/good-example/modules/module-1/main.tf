locals {
    parameter7 = "These values are locally hardcoded, do this with values that never (or rarely) change"
    parameter8 = "These values are locally hardcoded, do this with values that never (or rarely) change"
}

resource null_resource "example" {
    triggers = { parameter1 = var.parameter1 }

    provisioner "local-exec" {
        command = "echo -e \"and ${var.parameter1} \n and ${var.parameter2} \n and ${var.parameter3} \n and ${var.parameter4} \n and ${var.parameter5} \n and ${var.parameter6} \n and ${local.parameter7} \n and ${local.parameter8} \n\""
     }
}
