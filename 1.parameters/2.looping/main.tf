
# simple for
variable example_list {
    type = list(string)
    default = ["a", "b", "c"]
}
output example_list_out {
    value = [for s in var.example_list : upper(s)]
}
output example_list_out2 {
    value = [for i, v in var.example_list : "${i} is ${v}"]
}

# complex for
variable example_map {
    type = map(string)
    default = {
        aa = "a"
        bb = "b"
        cc = "c"
    }
}
output example_map_out {
    value = {for k, v in var.example_map : k => upper(v)}
}
# k = key 
# v = value

# more realistic examples:
# output "ids" {
#   value = values(tomap({
#     for k, public in aws_subnet.public : k => public.id
#   }))
# }

variable "objects" {
  type = list
  description = "list of objects"
  default = [
      {
        id = "name1"
        attribute = "a"
      },
      {
        id = "name2"
        attribute = "a,b"
      },
      {
        id = "name3"
        attribute = "d"
      }
  ]
}

output "object2" {
  value = var.objects[index(var.objects.*.id, "name2")]
}

#[{id = "name1", attribute = "a"}, {id = "name2", attribute = "a,b"}, {id = "name3", attribute = "d"}][index([{id = "name1", attribute = "a"}, {id = "name2", attribute = "a,b"}, {id = "name3", attribute = "d"}].*.id, "name2")]



variable "overly_complex_object" {
  type = map
  description = "an object filled with lists of objects"
  default = {
    a = [
      {
        id = "name1"
        attribute = "a"
      },
      {
        id = "name2"
        attribute = "a,b"
      },
      {
        id = "name3"
        attribute = "d"
      }
    ]
    b = [
      {
        id = "name1"
        attribute = "a"
      },
      {
        id = "name2"
        attribute = "a,b"
      },
      {
        id = "name3"
        attribute = "d"
      }
    ]
    c = [
      {
        id = "name1"
        attribute = "a"
      },
      {
        id = "name2"
        attribute = "a,b"
      },
      {
        id = "name3"
        attribute = "d"
      }
    ]
    d = [
      {
        id = "name1"
        attribute = "a"
      },
      {
        id = "name2"
        attribute = "a,b"
      },
      {
        id = "name3"
        attribute = "d"
      }
    ]
  }
}

output "overly_complex_object2" {
value = var.overly_complex_object.a[index(var.overly_complex_object.a.*.id, "name2")]
}
