storage = {
  name = "thisisaverylongstorageaccountnamethatexceeds24chars"
  resource_group = {
    name     = "example-resources"
    location = "North Europe"
  }
  account_tier             = "Standard"
  account_replication_type = "LRS"
  containers = {
    "godfather" = {
      
    }
    "starwars" = {
      
    }
    "matrix" = {
      
    }
  }
  tags = {
    environment = "dev"
  }
}
