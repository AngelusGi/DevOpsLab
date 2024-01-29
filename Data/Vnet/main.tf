data "azurerm_virtual_network" "devops" {
  name                = var.NAME
  resource_group_name = var.RG_NAME
}
