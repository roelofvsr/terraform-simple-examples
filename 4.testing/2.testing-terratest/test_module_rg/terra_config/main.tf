
# creating single resource group
module "test_module_rg" {
  source      = "../../modules/rg"
  rg-name     = var.rg-name
  rg-env      = var.rg-env
  rg-project  = var.rg-project
  rg-location = var.rg-location
  rg-tags     = var.rg-tags
}
