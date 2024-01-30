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
  description = "name of AKS instance"
  nullable    = false
}

variable "SKU" {
  type     = string
  default  = "Free"
  nullable = false
}

variable "NODE_SKU" {
  type     = string
  default  = "Standard_B2ls_v2"
  nullable = false
}

variable "NODE_DISK_SIZE" {
  type     = number
  default  = 30
  nullable = false
}

variable "NODE_COUNT_MAX" {
  type     = number
  default  = 4
  nullable = false
}

variable "NODE_COUNT_MIN" {
  type     = number
  default  = 1
  nullable = false
}

variable "NODE_COUNT" {
  type     = number
  default  = 2
  nullable = false
}

variable "VNET_NAME" {
  type        = string
  description = "name of the vnet"
  nullable    = false
}

variable "SP_CLIENT_ID" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "SP_CLIENT_SECRET" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "SUBNET_CIDR" {
  default = ["10.0.0.128/27"]
  sensitive = false
}

variable "SUBNET_NAME" {
  default = "aks-subnet"
  sensitive = false
}
