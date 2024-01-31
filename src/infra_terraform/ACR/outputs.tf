output "login_server" {
  value     = data.azurerm_container_registry.devops.login_server
  sensitive = false
}

output "login_psw" {
  value     = data.azurerm_container_registry.devops.admin_password
  sensitive = true
}

output "login_user" {
  value     = data.azurerm_container_registry.devops.admin_username
  sensitive = false
}
