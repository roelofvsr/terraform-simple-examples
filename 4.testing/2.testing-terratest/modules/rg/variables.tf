variable "rg-name" {}
variable "rg-env" {}
variable "rg-project" {}
variable "rg-location" {}
variable "rg-tags" {
  type = map(string)
  default = {
    "env"     = "dev"
    "project" = "mvp"
    "purpose" = "databricks"
  }
}
