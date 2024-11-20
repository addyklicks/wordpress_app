output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw
}
