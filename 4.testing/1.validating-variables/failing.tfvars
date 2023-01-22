# correct variable values
simplestring = { "one" = "two" }

longstring = "abcde"

# failing on age
# demographics = {
#   age = 25
#   name = "value"
# }

# failing on structure
demographics = {
  age  = 26
  anme = "incorrect"
}

# failing on input
complex = [{
  address = {
    city   = "value"
    street = "value"
    zip    = 1
  }
  age  = 1
  name = "value"
}]

# failing on input: note that error message is less helpful
instances = [
  {
    name  = "instance1"
    count = 3
    tags = {
      empty = ""
    }
  },
]