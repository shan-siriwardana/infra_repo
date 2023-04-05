output "network" {
  value       = module.networking.network_name
  description = "The name of the GCP network"
}

output "postgresql_private_ip" {
  value       = module.database.postgresql_private_ip
  description = "The private IP of the cloud SQL instance"
}

output "gke_cluster_name" {
  value       = module.kubernetes.gke_cluster_name
  description = "The GKE cluster name"
}