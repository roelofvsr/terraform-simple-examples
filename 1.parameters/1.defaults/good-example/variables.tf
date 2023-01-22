# Note that since we have default inside the module we do not have to define all 8 variables here
variable "parameter1" {}
variable "parameter2" {}
variable "parameter3" {}

variable "parameter4" {
    default = "This variables has a default value inside the root of the tf project"
}
variable "parameter5" {
    default = "This variable as well"
}
