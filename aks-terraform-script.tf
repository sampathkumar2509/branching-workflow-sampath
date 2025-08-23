provider "azurerm" {
  features {}
  subscription_id = "b594b554-243c-4a39-8ef3-bd8a06d57898"
  tenant_id       = "84731139-bc45-4c8a-9f7e-00558d558920"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-rg"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "akscluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    environment = "dev"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}
