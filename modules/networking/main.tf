locals {
  subnets = {
    for subnet in var.subnets :
    "${subnet.subnet_region}/${subnet.subnet_name}" => subnet
  }
}

locals {
  private_subnets = {
    for subnet in var.subnets :
    "${subnet.subnet_region}/${subnet.subnet_name}" => subnet
    if subnet.type == "private"
  }
}

resource "google_compute_network" "network" {
  name        = var.network_name
  description = var.network_description
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each      = local.subnets
  name          = each.value.subnet_name
  ip_cidr_range = each.value.subnet_ip
  region        = each.value.subnet_region
  network       = var.network_name
  depends_on = [
    google_compute_network.network
  ]
}

resource "google_compute_router" "router" {
  name    = var.router
  network = var.network_name
  depends_on = [
    google_compute_subnetwork.subnetwork
  ]
}

resource "google_compute_router_nat" "route_nat" {
  name                               = var.nat
  router                             = google_compute_router.router.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  dynamic "subnetwork" {
    for_each = local.private_subnets
    content {
      name                    = subnetwork.value["subnet_name"]
      source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
  }

  depends_on = [
    google_compute_router.router
  ]
}
