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

variable "node_locations" {
  type        = list(any)
  description = "The list of zones in which the node pool's nodes should be located."
}

variable "initial_node_count" {
  type        = string
  description = "The initial number of nodes for the pool."
}

variable "autoscale_min_node_count" {
  type        = string
  description = "Minimum number of nodes per zone in the NodePool."
  defualt     = "1"
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









