variable "vpc_name" {
  type = string
}
variable "gke_ip_range" {
  type = string
}

########## incoming_rule
variable "incoming_rule_name" {
  description = "<YOUR-PROJECT>-dev-incoming-rule"
  type        = string
  default     = "allow-only-ssh"
}

variable "incoming_rule_protocal" {
  description = "<YOUR-PROJECT>-dev-incoming-rule-protocal"
  type        = string
  default     = "all"
}

variable "incoming_rule_ports" {
  description = "<YOUR-PROJECT>-dev-incoming-rule-ports"
  type        = list(string)
  default     = [] #"22","80","443","29092","4222","6379","27100","3000"
}

variable "incoming_rule_source_ranges" {
  description = "<YOUR-PROJECT>-dev-incoming-rule-source-ranges"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "incoming_rule_tags" {
  description = "<YOUR-PROJECT>-dev-incoming-rule-tags"
  type        = list(string)
  default     = [
    "allow-only-ssh"
    ]
}


########## outgoing_rule
variable "outgoing_rule_name" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule"
  type        = string
  default     = "allow-all-outgoing"
}

variable "outgoing_rule_protocol" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule-protocal"
  type        = string
  default      = "all"
}

variable "outgoing_rule_ports" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule-ports"
  type        = list(string)
  default     = []
}

variable "outgoing_rule_destination_ranges" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule-destination-ranges"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "outgoing_rule_tags" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule-tags"
  type        = list(string)
  default     = [
    "all-outgoing"
    ]
}

variable "outgoing_rule_priority" {
  description = "<YOUR-PROJECT>-dev-outgoing-rule-priority"
  type        = string
  default     = "1000"
}



########## open for internal
variable "internal_name" {
  description = "allow gke to internal"
  type        = string
  default     = "ets-gke-dev-internal"
}

variable "internal_protocal" {
  description = "<YOUR-PROJECT>-dev-internal-protocal"
  type        = string
  default     = "tcp"
}

variable "internal_ports" {
  description = "<YOUR-PROJECT>-dev-internal-ports"
  type        = list(string)
  default     = ["0-65535"]
}

variable "internal_source_tags" {
  description = "<YOUR-PROJECT>-dev-source-internal-tags"
  type        = list(string)
  default     = [
    "ets-gke-dev-source-internal-tags"
    ]
}

variable "internal_tags" {
  description = "<YOUR-PROJECT>-dev-internal-tags"
  type        = list(string)
  default     = [
    "ets-gke-dev-internal-tags"
    ]
}
variable "internal_priority" {
  description = "The priority of the firewall rule"
  type        = number
  default     = 1000
}
variable "internal_direction" {
  description = "The direction of the firewall rule"
  type        = string
  default     = "INGRESS"
}

variable "internal_sources_range" {
  description = "Sources Range"
  type        = string
  default     = "10.142.0.0/16"
}

variable "list_internal_sources_range" {
  description = "Sources Range"
  type        = list(string)
  default     = []
  
}



# ########## Mongodb
# variable "mongodb_name" {
#   description = "allow gke to mongodb"
#   type        = string
#   default     = "<YOUR-PROJECT>-dev-mongodb"
# }

# variable "mongodb_protocal" {
#   description = "<YOUR-PROJECT>-dev-mongodb-protocal"
#   type        = string
#   default     = "tcp"
# }

# variable "mongodb_ports" {
#   description = "<YOUR-PROJECT>-dev-mongodb-ports"
#   type        = list(string)
#   default     = ["27017"]
# }

# variable "mongodb_tags" {
#   description = "<YOUR-PROJECT>-dev-mongodb-tags"
#   type        = list(string)
#   default     = [
#     "<YOUR-PROJECT>-dev-mongodb-tags"
#     ]
# }
# variable "mongodb_priority" {
#   description = "The priority of the firewall rule"
#   type        = number
#   default     = 1000
# }
# variable "mongodb_direction" {
#   description = "The direction of the firewall rule"
#   type        = string
#   default     = "INGRESS"
  
# }



# ########## Redis
# variable "redis_name" {
#   description = "allow gke to redis"
#   type        = string
#   default     = "<YOUR-PROJECT>-dev-redis"
# }

# variable "redis_protocal" {
#   description = "<YOUR-PROJECT>-dev-redis-protocal"
#   type        = string
#   default     = "tcp"
# }

# variable "redis_ports" {
#   description = "<YOUR-PROJECT>-dev-redis-ports"
#   type        = list(string)
#   default     = ["6379"]
# }

# variable "redis_tags" {
#   description = "<YOUR-PROJECT>-dev-redis-tags"
#   type        = list(string)
#   default     = [
#     "<YOUR-PROJECT>-dev-redis-tags"
#     ]
# }
# variable "redis_priority" {
#   description = "The priority of the firewall rule"
#   type        = number
#   default     = 2000
# }
# variable "redis_direction" {
#   description = "The direction of the firewall rule"
#   type        = string
#   default     = "INGRESS"
  
# }



# ########## Kafka
# variable "kafka_name" {
#   description = "allow gke to kafka"
#   type        = string
#   default     = "<YOUR-PROJECT>-dev-kafka"
# }

# variable "kafka_protocal" {
#   description = "<YOUR-PROJECT>-dev-kafka-protocal"
#   type        = string
#   default     = "tcp"
# }

# variable "kafka_ports" {
#   description = "<YOUR-PROJECT>-dev-kafka-ports"
#   type        = list(string)
#   default     = ["9092"]
# }

# variable "kafka_tags" {
#   description = "<YOUR-PROJECT>-dev-kafka-tags"
#   type        = list(string)
#   default     = [
#     "<YOUR-PROJECT>-dev-kafka-tags"
#     ]
# }
# variable "kafka_priority" {
#   description = "The priority of the firewall rule"
#   type        = number
#   default     = 3000
# }
# variable "kafka_direction" {
#   description = "The direction of the firewall rule"
#   type        = string
#   default     = "INGRESS"
  
# }


# ########## nat
# variable "nat_name" {
#   description = "allow gke to nat"
#   type        = string
#   default     = "<YOUR-PROJECT>-dev-nat"
# }

# variable "nat_protocal" {
#   description = "<YOUR-PROJECT>-dev-nat-protocal"
#   type        = string
#   default     = "tcp"
# }

# variable "nat_ports" {
#   description = "<YOUR-PROJECT>-dev-nat-ports"
#   type        = list(string)
#   default     = ["9092"]
# }

# variable "nat_tags" {
#   description = "<YOUR-PROJECT>-dev-nat-tags"
#   type        = list(string)
#   default     = [
#     "<YOUR-PROJECT>-dev-nat-tags"
#     ]
# }
# variable "nat_priority" {
#   description = "The priority of the firewall rule"
#   type        = number
#   default     = 3000
# }
# variable "nat_direction" {
#   description = "The direction of the firewall rule"
#   type        = string
#   default     = "INGRESS"
  
# }

