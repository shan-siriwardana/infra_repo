resource "google_sql_database_instance" "db_instance" {
  name                = var.db_instance_name
  database_version    = var.db_version
  deletion_protection = false

  settings {
    tier                        = var.db_instance_type
    db_availability_type           = var.db_availability_type  # (REGIONAL) or single zone (ZONAL).'
    deletion_protection_enabled = var.deletion_protection_enabled
    disk_autoresize = true
    disk_size = var.db_disk_size  # set 10G in module vars
    disk_type = var.db_disk_type # set PD_HDD in module vars

    backup_configuration =  {
        enabled                        = var.backups_enabled  # set to false in mod vars
      }



ip_configuration = {

        ipv4_enabled                                  = false
        private_network                               = var.private_network
        enable_private_path_for_google_cloud_services = true
        # dynamic "authorized_networks" {
        #   for_each = lookup(ip_configuration.value, "authorized_networks", [])
        #   content {
        #     expiration_time = lookup(authorized_networks.value, "expiration_time", null)
        #     name            = lookup(authorized_networks.value, "name", null)
        #     value           = lookup(authorized_networks.value, "value", null)
        #   }
        # }
      }
    }

}

resource "google_sql_database" "database" {
  name     = var.app_database
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "users" {
  name     = var.db_username
  password = var.db_password
  instance = google_sql_database_instance.db_instance.name
}
