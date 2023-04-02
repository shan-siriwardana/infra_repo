module "networking" {
  source       = "modules/networking"
  network_name = var.network_name
  subnets = var.subnets
}