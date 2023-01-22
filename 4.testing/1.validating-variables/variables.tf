# a variable with a simple verification on type
variable "simplestring" {
  type    = string
  default = "default value"
}

# a variable with a complex verfification
variable "longstring" {
  type = string
  validation {
    condition     = length(var.longstring) > 5
    error_message = "The variable2 must be longer than 5 characters."
  }
}

# a variable with a complex object definition and verification
variable "demographics" {
  type = object({
    name = string
    age  = number
  })
  validation {
    condition     = var.demographics.age > 25
    error_message = "The variable3 must be older than 18 years."
  }
}


# not-looped: a complex variable definition with three levels of nesting and verfications
variable "complex" {
  type = list(object({
    name = string
    age  = number
    address = object({
      street = string
      city   = string
      zip    = number
    })
  }))
  validation {
    condition     = length(var.complex) > 0
    error_message = "The variable4 must have at least one element."
  }
  validation {
    condition     = var.complex[0].age > 25
    error_message = "The variable4 must be older than 18 years."
  }
  validation {
    condition     = var.complex[0].address.zip > 1000
    error_message = "The variable4 must have a zip code greater than 10000."
  }
}


# validation in a looped manner, source:
#https://andyhunt.me/til/2021/03/04/you-can-fully-validate-a-complex-input-object-in-terraform/
variable "instances" {
  type = list(object({
    name  = string
    count = number
    tags  = map(string)
  }))

  validation {
    condition = (
      alltrue([for instance in var.instances : (
        length(instance.name) > 0
        && (instance.count % 3) == 0
        && lookup(instance.tags, "business_unit", null) != null
      )])
    )
    error_message = "Validation of an object failed"
  }
}

