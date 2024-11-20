resource "azurerm_kubernetes_cluster" "main" {
  name                = "k8s-cluster"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "k8s-dns"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Production"
  }
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw
}
