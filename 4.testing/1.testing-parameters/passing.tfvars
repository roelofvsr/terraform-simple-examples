# correct variable values
simplestring = ""

longstring = "somethinglong"

# demographics = {
#   age = 26
#   name = "value"
# }

# note additional key value pairs are allowed
demographics = {
  age   = 26
  name  = "value"
  extra = "correct"
}

complex = [{
  age  = 26
  name = "value"
  address = {
    street = 26
    city   = "value"
    zip    = 1001
  }
  },

  {
    age  = 26
    name = "value"
    address = {
      street = 26
      city   = "value"
      zip    = 1
    }
  }
]

instances = [
    {
        name = "instance1"
        count = 3
        tags = {
            business_unit = "BU1"
        }
    },
    {
        name = "instance2"
        count = 6
        tags = {
            business_unit = "BU2"
        }
    },
    {
        name = "instance3"
        count = 9
        tags = {
            business_unit = "BU3"
        }
    }
]