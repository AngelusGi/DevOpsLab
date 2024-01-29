module "DEVOPS_RG" {
  source  = "./Data/ResoruceGroup"
  RG_NAME = var.DEVOPS_RG_NAME
}

module "DEVOPS_VNET" {
  source       = "./Data/Vnet"
  depends_on   = [module.DEVOPS_RG]
  VNET_NAME    = var.DEVOPS_VNET_NAME
  VNET_RG_NAME = var.DEVOPS_VNET_RG_NAME
}

module "DEVOPS_ACR" {
  source     = "./ACR"
  depends_on = [module.DEVOPS_RG, module.DEVOPS_VNET]
  ACR_NAME   = var.DEVOPS_ACR_NAME
  LOCATION   = module.DEVOPS_RG.LOCATION
  RG_NAME    = module.DEVOPS_RG.NAME
}
