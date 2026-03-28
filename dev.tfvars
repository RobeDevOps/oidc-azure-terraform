storage = {
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
  containers = {
    movies = {
      
    }
    logs = {
      
    }
  }
}
