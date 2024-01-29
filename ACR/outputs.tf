output "acr_login_server" {
  value     = data.azurerm_container_registry.devops.login_server
  sensitive = false
}

output "acr_login_psw" {
  value     = data.azurerm_container_registry.devops.admin_password
  sensitive = true
}

output "acr_login_user" {
  value     = data.azurerm_container_registry.devops.admin_username
  sensitive = false
}
