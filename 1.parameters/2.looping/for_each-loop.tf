# simple for
variable "example_list" {
  type    = list(string)
  default = ["a", "b", "c"]
}
output "example_list_output_v" {
  value = [for v in var.example_list : upper(v)]
}
#   + example_list_output_v  = [
#       + "A",
#       + "B",
#       + "C",
#     ]

output "example_list_output_kv" {
  value = [for k, v in var.example_list : "${k} is ${v}"]
}
# + example_list_output_kv = [
#       + "0 is a",
#       + "1 is b",
#       + "2 is c",
#     ]


# complex for - 1 - map
variable "example_map" {
  type = map(string)
  default = {
    aa = "a"
    bb = "b"
    cc = "c"
  }
}
output "example_map_output_kv" {
  value = { for k, v in var.example_map : k => upper(v) }
}
#  + example_map_output_kv  = {
#       + aa = "A"
#       + bb = "B"
#       + cc = "C"
#     }

# complex for - 2 - map with objects
variable "example_map_objects" {
  type        = list(any)
  description = "list of objects"
  default = [
    {
      id        = "name1"
      attribute = "a"
    },
    {
      id        = "name2"
      attribute = "a,b"
    },
    {
      id        = "name3"
      attribute = "d"
    }
  ]
}
output "example_map_objects_output" {
  value = var.example_map_objects[index(var.example_map_objects.*.id, "name2")]
}
# + example_map_objects_output = {
#       + attribute = "a,b"
#       + id        = "name2"
#     }


# complex for - 3 - map with objects
variable "overly_complex_object" {
  type        = map(any)
  description = "an object filled with lists of objects"
  default = {
    a = [
      {
        id        = "name1"
        attribute = "a"
      },
      {
        id        = "name2"
        attribute = "a,b"
      }
    ]
    b = [
      {
        id        = "name1"
        attribute = "a"
      },
      {
        id        = "name2"
        attribute = "a,b"
      }
    ]
    c = [
      {
        id        = "name1"
        attribute = "a"
      },
      {
        id        = "name2"
        attribute = "a,b"
      },
    ]
  }
}
output "overly_complex_object_output" {
  value = var.overly_complex_object.a[index(var.overly_complex_object.a.*.id, "name2")]
}
# + overly_complex_object_output = {
#       + attribute = "a,b"
#       + id        = "name2"
#     }
output "overly_complex_object_output2" {
  value = var.overly_complex_object.a[*].id
}
# + overly_complex_object_output2 = [
#       + "name1",
#       + "name2",
#     ]


# complex for - 4 - map with objects
variable "example_complex_map" {
  type = map(any)
  default = {
    team1 = {
      aa = "a"
      bb = "b"
      cc = "c"
    }
  }
}
output "example_complex_map_output" {
  value = { for k, v in var.example_complex_map.team1 : k => upper(v) }
}
# + example_complex_map_output    = {
#       + aa = "A"
#       + bb = "B"
#       + cc = "C"
#     }
output "example_complex_map_output2" {
  value = var.example_complex_map.team1.aa
}
#  + example_complex_map_output2   = "a"


# complex for - 4 - output to files
locals {
  all_teams = {
    team1 = {
      name      = "t1" # can be max 9 characters
      full_name = "team-one"
      tags = {
        this = "tag1-team1"
        that = "tag2-team1"
      }
    }
    team2 = {
      name      = "t2" # can be max 9 characters
      full_name = "team-two"
      tags = {
        this = "tag1-team2"
        that = "tag2-team2"
      }
    }
  }
}

resource "local_file" "loop-with-map" {
  for_each = local.all_teams

  content  = each.value.tags.this
  filename = "TEAM-${each.value.name}"
}
# this will results in 2 files
# TEAM-t1 -> content: data
# TEAM-t2 -> content: data