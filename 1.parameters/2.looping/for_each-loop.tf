# simple for
variable "example_list" {
  type    = list(string)
  default = ["a", "b", "c"]
}
output "example_list_out" {
  value = [for s in var.example_list : upper(s)]
}
output "example_list_out2" {
  value = [for i, v in var.example_list : "${i} is ${v}"]
}


# complex for - 0
variable "example_map" {
  type = map(string)
  default = {
    aa = "a"
    bb = "b"
    cc = "c"
  }
}
output "example_map_out" {
  value = { for k, v in var.example_map : k => upper(v) }
}
# k = key 
# v = value


# complex for - 1
variable "objects" {
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

output "object2" {
  value = var.objects[index(var.objects.*.id, "name2")]
}


# complex for - 2
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
      },
      {
        id        = "name3"
        attribute = "d"
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
      },
      {
        id        = "name3"
        attribute = "d"
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
      {
        id        = "name3"
        attribute = "d"
      }
    ]
    d = [
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
}

output "overly_complex_object2" {
  value = var.overly_complex_object.a[index(var.overly_complex_object.a.*.id, "name2")]
}


# complex for - 3
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

output "example_complex_map_out" {
  value = { for k, v in var.example_complex_map.team1 : k => upper(v) }
}
output "test" {
  value = var.example_complex_map.team1.aa
}


# complex for - 4
locals {
  all_teams = {
    team1 = {
      name      = "t1" # can be max 9 characters
      full_name = "team-one"
      tags = {
        this = "data"
        that = "data"
      }
    }
    team2 = {
      name      = "t2" # can be max 9 characters
      full_name = "team-two"
      tags = {
        this = "data"
        that = "data"
      }
    }
  }
}

resource "local_file" "loop-with-map" {
  for_each = local.all_teams

  content  = each.value.tags.this
  filename = "TEAM-${each.value.name}"
}
