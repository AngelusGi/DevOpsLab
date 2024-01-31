output "aks_login_server" {
  value = module.DEVOPS_AKS.login_server
}

output "aks_kubeconfig" {
  value     = module.DEVOPS_AKS.kubeconfig
  sensitive = true
}

output "vault_uri" {
  value = module.DEVOPS_KV.uri
}

output "acr_login_server" {
  value = module.DEVOPS_ACR.login_server
}

output "acr_login_psw" {
  value     = module.DEVOPS_ACR.login_psw
  sensitive = true
}

output "acr_login_user" {
  value = module.DEVOPS_ACR.login_user
}
