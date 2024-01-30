output "aks_login_server" {
  value     = data.azurerm_kubernetes_cluster.devops.fqdn
  sensitive = false
}

output "aks_kubeconfig" {
  value     = data.azurerm_kubernetes_cluster.devops.kube_admin_config
  sensitive = true
}

output "aks_network_profile" {
  value     = data.azurerm_kubernetes_cluster.devops.network_profile
  sensitive = false
}

output "aks_subnet" {
  value = data.azurerm_subnet.aks.address_prefix
  sensitive = false
}
