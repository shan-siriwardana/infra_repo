variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "network_description" {
  type        = string
  description = "Description of the network"
  default     = ""
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets"
}

variable "router" {
  type        = string
  description = "The name of the cloud router"
}

variable "nat" {
  type        = string
  description = "The name of the nat"
}

variable "db_instance_name" {
  description = "The name of database instance"
  type        = string
}

variable "db_version" {
  type        = string
  description = "Database version of the instance"
}

variable "db_instance_type" {
  type        = string
  description = "Type of the database instance"
}

variable "db_availability_type" {
  type        = string
  description = "Availability type of the db instance"
}

variable "db_disk_size" {
  type        = string
  description = "The size of the db instande disk"
}

variable "db_username" {
  type        = string
  description = "The database username"
}

variable "db_password" {
  type        = string
  description = "The database user's password"
}

variable "app_database" {
  type        = string
  description = "The name of the application database"
}

variable "cluster_name" {
  type        = string
  description = "The name of the kubernetes cluster"
}

variable "cluster_master_location" {
  type        = string
  description = "The location in which cluster master is created"
}

variable "node_pool_location" {
  type        = string
  description = "The location of the node pool"
}

variable "initial_node_count" {
  type        = string
  description = "The initial number of nodes for the pool."
}

variable "cluster_instance_subnet" {
  type        = string
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "artifactory_location" {
  type        = string
  description = "The location of the artifactory repository"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}



