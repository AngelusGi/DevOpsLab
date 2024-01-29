variable "VNET_NAME" {
  type        = string
  description = "name of VNet in wich create DevOps resources"
  nullable    = false
}

variable "VNET_RG_NAME" {
  type        = string
  description = "name of the rosource group in wich is contained the VNet"
  nullable    = false
}
