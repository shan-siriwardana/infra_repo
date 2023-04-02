module "networking" {
  source              = "./modules/networking"
  network_name        = var.network_name
  network_description = var.network_description
  subnets             = var.subnets
  router              = var.router
  nat                 = var.nat
}

module "database" {
  source               = "./modules/database"
  db_instance_name     = var.db_instance_name
  db_version           = var.db_version
  db_instance_type     = var.db_instance_type
  db_availability_type = var.db_availability_type
  db_disk_size         = var.db_disk_size
  app_database         = var.app_database
  private_network      = module.networking.network_id
  db_username          = var.db_username
  db_password          = var.db_password
  depends_on = [
    module.networking
  ]
}

# module "kubernetes" {
#   source               = "./modules/kubernetes"
#   cluster_name     = var.cluster_name
#   cluster_master_location           = var.cluster_master_location
#   cluster_network    = module.networking.network_id
#   node_locations = var.node_locations
#   initial_node_count         = var.initial_node_count
#   project_id = var.project_id
#   depends_on = [
#     module.networking
#   ]
# }

