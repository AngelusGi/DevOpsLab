resource "azurerm_kubernetes_cluster" "devops" {
  name                = "${var.NAME}-aks"
  location            = var.LOCATION
  resource_group_name = var.RG_NAME
  dns_prefix          = "${var.NAME}-k8s"
  sku_tier            = var.SKU

  default_node_pool {
    name                = "default"
    vm_size             = var.NODE_SKU
    os_disk_size_gb     = var.NODE_DISK_SIZE
    max_count           = var.NODE_COUNT_MAX
    min_count           = var.NODE_COUNT_MIN
    # node_count          = var.NODE_COUNT
    enable_auto_scaling = true
    os_disk_type        = "Managed"
  }

  service_principal {
    client_id     = var.SP_CLIENT_ID
    client_secret = var.SP_CLIENT_SECRET
  }

  role_based_access_control_enabled = true

}

resource "azurerm_subnet" "aks" {
  name                 = var.SUBNET_NAME
  resource_group_name  = var.RG_NAME
  virtual_network_name = var.VNET_NAME
  address_prefixes     = var.SUBNET_CIDR

  delegation {
    name = "delegation-aks"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

data "azurerm_kubernetes_cluster" "devops" {
  name                = azurerm_kubernetes_cluster.devops.name
  resource_group_name = azurerm_kubernetes_cluster.devops.resource_group_name
}

data "azurerm_subnet" "aks" {
  name                 = azurerm_subnet.aks.name
  virtual_network_name = azurerm_subnet.aks.virtual_network_name
  resource_group_name  = azurerm_subnet.aks.resource_group_name
}
