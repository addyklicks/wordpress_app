output "resource_group_name" {
  value = module.network.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "aks_cluster_name" {
  value = module.compute.aks_cluster_name
}

output "kubeconfig" {
  value = module.compute.kubeconfig
}