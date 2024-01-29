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
