terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name        = "ABC"
  bpdu_filter = true
  bpdu_guard  = true
}

data "aci_rest" "stpIfPol" {
  dn = "uni/infra/ifPol-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "stpIfPol" {
  component = "stpIfPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.stpIfPol.content.name
    want        = module.main.name
  }

  equal "ctrl" {
    description = "ctrl"
    got         = data.aci_rest.stpIfPol.content.ctrl
    want        = "bpdu-filter,bpdu-guard"
  }
}
