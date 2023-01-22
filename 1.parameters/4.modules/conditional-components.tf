locals {
  conditional = {
    config-1 = {
      extra-storage = false
    }
    config-2 = {
      extra-storage = true
    }
  }
}

# condition without extra storage
module "conditional-1" {
  source  = "./modules/conditional"
  config  = local.conditional.config-1
  name    = "conditional"
  st-name = "extra-storage"
}


# condition with extra storage
module "conditional-2" {
  source  = "./modules/conditional"
  config  = local.conditional.config-2
  name    = "conditional"
  st-name = "extra-storage"
}

