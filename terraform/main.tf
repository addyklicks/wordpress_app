provider "azurerm" {
  features {}
}

module "network" {
  source = "./modules/network"
}

module "compute" {
  source          = "./modules/compute"
  vnet_name       = module.network.vnet_name
  subnet_id       = module.network.subnet_id
  resource_group  = module.network.resource_group_name
  location        = module.network.location
}