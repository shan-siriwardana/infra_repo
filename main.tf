module "networking" {
  source       = "./modules/networking"
  network_name = var.network_name
  network_description = var.network_description
  subnets = var.subnets
  router = var.router
  nat = var.nat
}