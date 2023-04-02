output "network_id" {
  value       = google_compute_network.network.id
  description = "The name of the network"
}

output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the network"
}

output "subnets" {
  value       = google_compute_subnetwork.subnetwork
  description = "Subnets"
}