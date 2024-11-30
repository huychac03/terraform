variable "vpc_name" {
  description = "<YOUR-PROJECT>-dev-vpc"
  type        = string
  default     = "ets-dev-vpc"
}

# Subnet
variable "pub_subnet_name" {
  description = "<YOUR-PROJECT>-dev-subnet-name"
  type        = string
  default     = "public-subnet"
}

variable "subnet_ip_cidr_range" {
  description = "<YOUR-PROJECT>-dev-ip_cidr_range"
  type        = string
  default     = "10.142.0.0/16"
}

variable "pub_sub_cidr" {
  type = string
  default = "10.142.1.0/24"
}

variable "subnet_region" {
  description = "<YOUR-PROJECT>-dev-subnet-region"
  type        = string
  default     = "asia-southeast1"
}

variable "pri_sub_name" {
  type = string
  default = "private-subnet"
}

variable "pri_sub_cidr" {
  type = string
  default = "10.142.2.0/24"
}

variable "nat_ip_allocate_option" {
  type = string
  default = "MANUAL_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
  default = "LIST_OF_SUBNETWORKS"
}

variable "source_ip_ranges_to_nat" {
  type = list(string)
  default = ["ALL_IP_RANGES"]
}

variable "list_ip_cidr_range" {
  type = list(string)
  default = ["10.51.0.0/20" , "10.52.0.0/20" , "10.53.0.0/20"]
}

variable "list_range_name" {
  type = list(string)
  default = ["cidr-pod" , "cidr-service" , "cidr-pod-2"]
}