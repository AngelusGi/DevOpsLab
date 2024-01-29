variable "LOCATION" {
  type     = string
  nullable = false
}

variable "RG_NAME" {
  type        = string
  description = "name of the rosource group are contained DevOps Infra resources"
  nullable    = false
}

variable "NAME" {
  type        = string
  description = "name of ACR"
  nullable    = false
}

variable "SKU" {
  type     = string
  default  = "standard"
  nullable = false
}

variable "TENANT_ID" {
  type = string
  nullable = false
  sensitive = true
}

variable "SP_OBJECT_ID" {
  type = string
  nullable = false
  sensitive = true
}
