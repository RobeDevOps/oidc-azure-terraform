resource "azurerm_resource_group" "main" {
  name     = var.storage.resource_group.name
  location = var.storage.resource_group.location
}

resource "azurerm_storage_account" "recording" {
  name                     = var.storage.name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = var.storage.account_tier
  account_replication_type = var.storage.account_replication_type

  tags = var.storage.tags
}
output "containers" {
  value = var.storage.containers
}

resource "azurerm_storage_container" "containers" {
  for_each = var.storage.containers != null ? var.storage.containers : {}
  name                  = lower(each.value.name)
  storage_account_id    = azurerm_storage_account.recording.id
  container_access_type = "private"
}