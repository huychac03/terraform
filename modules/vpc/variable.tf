variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["172.31.32.0/20", "172.31.16.0/20", "172.31.0.0/20"]
}
 
# variable "private_subnet_cidrs" {
#  type        = list(string)
#  description = "Private Subnet CIDR values"
#  default     = ["10.0.128.0/24", "10.0.129.0/24", "10.0.130.0/24"]
# }

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}