variable "SP_CLIENT_ID" {
  nullable  = false
  sensitive = true
}

variable "SP_CLIENT_SECRET" {
  nullable  = false
  sensitive = true
}

variable "SP_TENANT_ID" {
  nullable  = false
  sensitive = true
}

variable "AZ_SUBSCRIPTION_ID" {
  nullable  = false
  sensitive = true
}

variable "DEVOPS_RG_NAME" {
  nullable    = false
  description = "name of the rosource group are contained DevOps Infra resources"
  type        = string
}

variable "DEVOPS_VNET_NAME" {
  nullable    = false
  description = "name of VNet in wich create DevOps resources"
  type        = string
}

variable "DEVOPS_VNET_RG_NAME" {
  nullable    = false
  description = "name of the rosource group in wich is contained the VNet"
  type        = string
}

variable "DEVOPS_ACR_NAME" {
  nullable    = false
  type        = string
}

variable "DEVOPS_KV_NAME" {
  nullable    = false
  type        = string
}

variable "DEVOPS_AKS_NAME" {
  nullable    = false
  type        = string
}

# locals {
#   TFSTATE_FILE_NAME = contains(var.TF_STATE_FILE_NAME, ".tfstate") ? var.TF_STATE_FILE_NAME : "${var.TF_STATE_FILE_NAME}.tfstate"
# }
