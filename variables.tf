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