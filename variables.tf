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