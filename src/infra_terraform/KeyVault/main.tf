resource "azurerm_key_vault" "devops" {
  name                        = var.NAME
  location                    = var.LOCATION
  resource_group_name         = var.RG_NAME
  enabled_for_disk_encryption = true
  tenant_id                   = var.TENANT_ID
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.SKU

  access_policy {
    tenant_id = var.TENANT_ID
    object_id = var.SP_OBJECT_ID

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]

  }
}

data "azurerm_key_vault" "devops" {
  name                = azurerm_key_vault.devops.name
  resource_group_name = azurerm_key_vault.devops.resource_group_name
}
