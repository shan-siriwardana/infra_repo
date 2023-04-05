output "postgresql_private_ip" {
  value       = google_sql_database_instance.db_instance.ip_address.0.ip_address 
  description = "The private IP of the cloud SQL instance"
}