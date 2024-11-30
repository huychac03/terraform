variable "project_name" {
  description = "<YOUR-PROJECT>-dev-gke-cluster"
  type = string
  default = "ets-dev-gke-cluster"
}

variable "gke_network" {
  type = string
}

variable "gke_subnet" {
  type = string
}

variable "list_ip_allocation_policy" {
  default = []
}

variable "node-name" {
  description = "<YOUR-PROJECT>-dev-gke-node-pool"
  type = string
  default = "ets-dev-node-pool"
}

variable "regional" {
  type = string
  default = "asia-southeast1"
}

variable "zones" {
  type = list(string)
  default = [
    "asia-southeast1"
    #"asia-southeast1-b"
  ]
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "initial_node_count" {
  default     = 1
  description = "number of initial nodes"
}

variable "machine_type" {
  default     = "e2-medium"
  description = "machine type"
}
