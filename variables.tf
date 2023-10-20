variable "region_map" {
  type = map(string)
  default = {
    EU  = "westeurope"
    NA  = "centralus"
    SA  = "southafricanorth"
    UAE = "uaenorth"
    UK  = "uksouth"
  }
}

variable "azcomputeresourcesku_map" {
  type = map(string)
  default = {
    dev     = "Standard_B1ls"
    staging = "Standard_B1ls"
    qa      = "Standard_B1ls"
    prod    = "Standard_B1ls"
  }
}

variable "nested_map" {
  description = "An example of a nested map"
  type        = map(map(string))
  default = {
    map1 = {
      key1 = "value1"
      key2 = "value2"
    }
    map2 = {
      key1 = "value3"
      key2 = "value4"
    }
  }
}

variable "nested_jedi_map" {
  description = "An example of a nested map"
  type        = map(map(string))
  default = {
    Light = {
      key1 = "value1"
      key2 = "value2"
    }
    Dark = {
      key1 = "value3"
      key2 = "value4"
    }
  }
}

variable "force_map" {
  type = map(string)
  default = {
    luke  = "jedi"
    yoda  = "jedi"
    darth = "sith"
  }
}

variable "tf_map" {
  description = "A map of VM SKUs"
  type        = map(map(string))
  default = {
    dev = {
      eu = "Standard_A0"
      na = "Standard_A1"
      sa = "Standard_A2"
      uk = "Standard_A3"
    }
    staging = {
      eu = "Standard_B0"
      na = "Standard_B1"
      sa = "Standard_B2"
      uk = "Standard_B3"
    }
    qa = {
      eu = "Standard_C0"
      na = "Standard_C1"
      sa = "Standard_C2"
      uk = "Standard_C3"
    }
    prod = {
      eu = "Standard_D0"
      na = "Standard_D1"
      sa = "Standard_D2"
      uk = "Standard_D3"
    }
  }
}

