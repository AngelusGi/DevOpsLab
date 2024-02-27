variable "NAME" {
  type        = string
  description = "name of VNet in wich create DevOps resources"
  nullable    = false
}

variable "RG_NAME" {
  type        = string
  description = "name of the rosource group in wich is contained the VNet"
  nullable    = false
}
