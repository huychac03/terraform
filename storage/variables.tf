variable "bucket_name" {
  type = string
  default = "<YOUR-PROJECT>-dev-bucket-cloudaz"
}

variable "bucket_name_data" {
  type = string
  default = "<YOUR-PROJECT>-dev-data-bucket-cloudaz"
}

variable "location" {
  type = string
  default = "asia-southeast1"
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}

variable "lifecycle_rule_condition_age" {
  type = number
  default = 30
}

variable "lifecycle_rule_condition_actione" {
  type = string
  default = "Delete"
  
}