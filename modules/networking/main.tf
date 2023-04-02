# define local values
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

# define networking resources
resource "google_compute_network" "network" {
  name        = var.network_name
  description = var.network_description
  auto_create_subnetworks = false
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

# private networking with GCP service provider
resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = google_compute_network.network.id
  depends_on = [
    google_compute_network.network
  ]
}

# Create a private connection
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
  depends_on = [
    google_compute_network.network,google_compute_global_address.private_ip_alloc
  ]
}