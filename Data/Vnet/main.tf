data "azurerm_virtual_network" "devops" {
  name                = var.VNET_NAME
  resource_group_name = var.VNET_RG_NAME
}
