module "DEVOPS_RG" {
  source = "./Data/ResoruceGroup"
  NAME   = var.DEVOPS_RG_NAME
}

module "DEVOPS_VNET" {
  source     = "./Data/Vnet"
  depends_on = [module.DEVOPS_RG]
  NAME       = var.DEVOPS_VNET_NAME
  RG_NAME    = var.DEVOPS_VNET_RG_NAME
}

module "DEVOPS_ACR" {
  source     = "./ACR"
  depends_on = [module.DEVOPS_RG, module.DEVOPS_VNET]
  NAME       = var.DEVOPS_ACR_NAME
  LOCATION   = module.DEVOPS_RG.LOCATION
  RG_NAME    = module.DEVOPS_RG.NAME
}

module "AZURE_IDENTITY" {
  source = "./Data/CurrentClient"
}

module "DEVOPS_KV" {
  source       = "./KeyVault"
  depends_on   = [module.DEVOPS_ACR, module.AZURE_IDENTITY]
  NAME         = var.DEVOPS_KV_NAME
  LOCATION     = module.DEVOPS_RG.LOCATION
  RG_NAME      = module.DEVOPS_RG.NAME
  SP_OBJECT_ID = module.AZURE_IDENTITY.object_id
  TENANT_ID    = module.AZURE_IDENTITY.tenant_id
}

module "DEVOPS_AKS" {
  source           = "./AKS"
  depends_on       = [module.DEVOPS_ACR, module.AZURE_IDENTITY]
  NAME             = var.DEVOPS_AKS_NAME
  LOCATION         = module.DEVOPS_RG.LOCATION
  RG_NAME          = module.DEVOPS_RG.NAME
  SP_CLIENT_ID     = module.AZURE_IDENTITY.client_id
  SP_CLIENT_SECRET = var.SP_CLIENT_SECRET
  VNET_NAME        = module.DEVOPS_VNET.NAME
}
