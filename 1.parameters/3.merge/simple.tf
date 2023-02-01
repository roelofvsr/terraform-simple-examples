# simple example
locals {
  some_default_values2 = {
    "a" = "value1"
    "b" = "value2"
  }
}

variable "custom-values2" {
  type = map(string)
  default = {
    "a" = "override-default"
    "c" = "value3"
  }
}

output "merge-output2" {
  value = merge(local.some_default_values2, var.custom-values2)
}