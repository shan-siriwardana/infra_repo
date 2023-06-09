network_name        = "demoapp-network"
network_description = "network for the go demo application"
subnets = [
  {
    subnet_name   = "public-subnet-01"
    subnet_ip     = "10.1.0.0/20"
    subnet_region = "us-central1"
    type          = "public"
  },
  {
    subnet_name   = "public-subnet-02"
    subnet_ip     = "10.1.16.0/20"
    subnet_region = "us-central1"
    type          = "public"
  },
  {
    subnet_name   = "private-subnet-01"
    subnet_ip     = "10.1.32.0/20"
    subnet_region = "us-central1"
    type          = "private"
  },
  {
    subnet_name   = "private-subnet-02"
    subnet_ip     = "10.1.48.0/20"
    subnet_region = "us-central1"
    type          = "private"
  }
]
router           = "demoapp-router"
nat              = "demoapp-nat"
db_instance_name = "demoapp-db-instance"
db_version       = "POSTGRES_9_6"
db_instance_type = "db-g1-small"
# db_availability_type will be set to 'REGIONAL' in actual implementation to achive high availability
db_availability_type = "ZONAL"
db_disk_size         = 10
app_database         = "app"


cluster_name = "demoapp-cluster"
# cluster locations/node count will be regionl/multiple  in the actual implementation to achieve high availability
cluster_master_location = "us-central1-a"
node_pool_location          = "us-central1-a"
cluster_instance_subnet = "private-subnet-01"
initial_node_count      = "1"
artifactory_location = "us-central1"
project_id              = "tst-project-112334"
