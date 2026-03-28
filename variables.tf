variable "storage" {
  description = "Objeto completo para crear un storage account: name, resource_group, location, account_tier, account_replication_type, tags"
  type = object({
    name = string
    resource_group = object({
      name     = string
      location = optional(string)
    })
    account_tier             = optional(string)
    account_replication_type = optional(string)
    tags                     = optional(map(string))
    containers               = optional(map(object({
      name = string
    })))
  })
  default = {
    name = "bobcontruyeexample"
    resource_group = {
      name     = "example-resources"
      location = "East Us"
    }
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
    }
    containers = {   }
  }

  validation {
    condition     = contains(["east us", "west us", "central us"], lower(var.storage.resource_group.location))
    error_message = "La ubicación debe ser una de: East Us, West Us, Central Us."
  }

  validation {
    condition     = length(var.storage.name) < 24
    error_message = "El nombre del storage account debe tener menos de 24 caracteres."
  }

  validation {
    condition     = contains(["Standard", "Premium"], var.storage.account_tier)
    error_message = "El account_tier debe ser 'Standard' o 'Premium'."
  }

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS"], var.storage.account_replication_type)
    error_message = "El account_replication_type debe ser uno de: LRS, GRS, RAGRS, ZRS, GZRS."
  }
}
