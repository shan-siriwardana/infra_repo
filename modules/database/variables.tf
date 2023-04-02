variable "db_instance_name" {
  description = "The name of database instance"
  type        = string
}

variable "db_version" {
  type        = string
  description = "Database version of the instance"
  default = "POSTGRES_9_6"
}

variable "db_instance_type" {
  type        = string
  description = "Type of the database instance"
  default = "db-f1-micro"
}

variable "db_availability_type" {
  type        = string
  description = "Availability type of the db instance"
  default = "ZONAL"
}

variable "db_disk_size" {
  type        = string
  description = "The size of the db instande disk"
  default = "10"
}

variable "db_disk_type" {
  type        = string
  description = "The type of the db instande disk"
  default = "PD_HDD"
}

variable "backups_enabled" {
  type        = bool
  description = "Enable backups"
  default = "false"
}

variable "private_network" {
  type        = string
  description = "he VPC network from which the Cloud SQL instance is accessible for private IP."
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

variable "deletion_protection_enabled" {
    type =  bool
    description = "database instance delete protection enabled or not"
    default = false
}