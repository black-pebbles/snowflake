variable "credentials" {
    type        = string
    description = "Location of the credentials keyfile"
}

variable "project_id" {
    type = string
    description = "project id"
}

variable "region" {
    type = string
    description = "cluster's region"
}

variable "zones" {
    type = list(string)
    description = "cluster's zones"
}

variable "name" {
    type = string
    description = "cluster's name"
}

variable "machine_type" {
    type = string
    description = "type of compute engine"
}

variable "min_count" {
    type = number
    description = "minimum number of nodes in node_pools"
}

variable "max_count" {
    type = number
    description = "maximum number of nodes in node_pools"
}

variable "disk_size_gb" {
    type = number
    description = "disk size allocated to a node"
}

variable "service_account" {
    type = string
    description = "service account to run the nodes"
}

variable "initial_node_count" {
    type = number
    description = "number of nodes to create in cluster's node pool"
}
