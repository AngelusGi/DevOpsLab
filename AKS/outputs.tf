output "login_server" {
  value     = data.azurerm_kubernetes_cluster.devops.fqdn
  sensitive = false
}

output "kubeconfig" {
  value     = data.azurerm_kubernetes_cluster.devops.kube_config
  sensitive = true
}

output "network_profile" {
  value     = data.azurerm_kubernetes_cluster.devops.network_profile
  sensitive = false
}

output "subnet" {
  value = data.azurerm_subnet.aks.address_prefix
  sensitive = false
}
