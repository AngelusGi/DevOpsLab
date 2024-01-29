variable "LOCATION" {
  type     = string
  nullable = false
}

variable "RG_NAME" {
  type        = string
  description = "name of the rosource group are contained DevOps Infra resources"
  nullable    = false
}

variable "ACR_NAME" {
  type        = string
  description = "name of ACR"
  nullable    = false
}

variable "ACR_SKU" {
  type     = string
  default  = "Basic"
  nullable = false
}
