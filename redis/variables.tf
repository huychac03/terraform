variable "region" {
  description = "The region in which the Redis instance will be created"
  type        = string
  default     = "asia-southeast1"
}

variable "instance_name" {
  description = "The name of the Redis instance"
  type        = string
  default     = "<YOUR-PROJECT>-dev-redis"
}

variable "instance_tier" {
  description = "The tier of the Redis instance"
  type        = string
  default     = "BASIC"
}

variable "instance_memory_size_gb" {
  description = "The memory size of the Redis instance"
  type        = number
  default     = 2
}

variable "redis_network" {
  type        = string
  description = "The vpc network id that instance attached to"

}
variable "instance_connect_mode" {
  type    = string
  default = "DIRECT_PEERING"
  #default = "PRIVATE_SERVICE_ACCESS"
}



