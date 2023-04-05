output "gke_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "The GKE cluster name"
}

output "artifactory_name" {
  value       = google_artifact_registry_repository.demoapp_repo.name
  description = "The GCP artifactory repository name"
}