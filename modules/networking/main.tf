locals {
  subnets = {
    for subnet in var.subnets :
    "${subnet.subnet_region}/${subnet.subnet_name}" => subnet
  }
}

resource "google_compute_network" "network" {
  name                            = var.network_name
  description                     = var.description
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each                   = local.subnets
  name                       = each.value.subnet_name
  ip_cidr_range              = each.value.subnet_ip
  region                     = each.value.subnet_region
  network     = var.network_name
}
