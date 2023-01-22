
# resource group
resource "azurerm_resource_group" "default" {
  name     = format("rg-%s-%s-%s", var.rg-name, var.rg-project, var.rg-env)
  location = var.rg-location
  tags     = var.rg-tags
}
