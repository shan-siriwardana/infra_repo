output "gke_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "The GKE cluster name"
}