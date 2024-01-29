output "virtual_network_id" {
  value = data.azurerm_virtual_network.devops.id
}

output "virtual_network_name" {
  value = data.azurerm_virtual_network.devops.name
}
