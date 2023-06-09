variable "cluster_name" {
  type        = string
  description = "The name of the kubernetes cluster"
}

variable "cluster_master_location" {
  type        = string
  description = "The location in which cluster master is created"
}

variable "cluster_network" {
  type        = string
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
}

variable "node_pool_location" {
  type        = string
  description = "The location of the node pool"
}

variable "initial_node_count" {
  type        = string
  description = "The initial number of nodes for the pool."
}

variable "autoscale_min_node_count" {
  type        = string
  description = "Minimum number of nodes per zone in the NodePool."
  default     = "1"
}

variable "autoscale_max_node_count" {
  type        = string
  description = "Minimum number of nodes per zone in the NodePool."
  default     = "2"
}

variable "node_machine_type" {
  type        = string
  description = "Machine type of nodepool's nodes"
  default     = "e2-small"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "cluster_instance_subnet" {
  type        = string
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "artifactory_location" {
  type        = string
  description = "The location of the artifactory repository"
}













