
module "remote-module-1" {
  # http
  source = "github.com/roelofvsr/terraform-examples/2.remote=modules/modules/module-1"
  input  = "remote-module-1"
}