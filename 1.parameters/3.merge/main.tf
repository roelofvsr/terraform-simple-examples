locals {
  some_default_values = {
    "default" = "value1"
    "default" = "value2"
  }
}

variable "custom-values" {
  type = map(string)
  default = {
    "custom" = "value3"
  }
}

# convert map into string to easily echo
locals {
  string_value = replace(replace(jsonencode(
    merge(
      local.some_default_values,
      var.custom-values,
      { "custom-local" = "value4" },
      { "default" = "override-locally" }
    )
  ), "\"", ""), ":", "=")
}

resource "null_resource" "merge-example" {
  triggers = local.some_default_values

  provisioner "local-exec" {
    command = "echo ${local.string_value}"
  }
}
