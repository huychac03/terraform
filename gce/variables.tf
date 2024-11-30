variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}

variable "gce_name" {
  type = list(string)
  default = [
    "<YOUR-PROJECT>-dev-gce-mongodb",
    "<YOUR-PROJECT>-dev-gce-kafka",
    "<YOUR-PROJECT>-dev-gce-nats"
  ]
}

variable "machine_type" {
  type = list(string)
  default = [
    "e2-medium",
    "e2-medium",
    "e2-medium"
  ]
}

variable "gce_size" {
  type = list(number)
  default = [
    100,
    100,
    100
  ]
}

variable "gce_network" {
  type = string
}

variable "gce_subnet" {
  type = string
}

variable "sa_id" {
  type    = string
  default = ""
}

variable "ssh-public-key" {
  type    = string
  default = ""
}
