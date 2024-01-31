resource "azurerm_container_registry" "devops" {
  name                          = var.NAME
  resource_group_name           = var.RG_NAME
  location                      = var.LOCATION
  sku                           = var.SKU
  admin_enabled                 = true
  # public_network_access_enabled = false
  public_network_access_enabled = true
}

data "azurerm_container_registry" "devops" {
  name                = azurerm_container_registry.devops.name
  resource_group_name = azurerm_container_registry.devops.resource_group_name
}
