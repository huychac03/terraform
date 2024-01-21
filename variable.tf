################################################################################
# Instance - EC2
################################################################################

# variable "EC2_name" {
#   description = "EC2 name"
#   type = string
#   default = "New-EC2-created-by-Terraform"
# }

# variable "ami_id" {
#   description = "ami_id"
#   type = string
#   default = "ami-0fa377108253bf620"
# }

# variable "instance_type" {
#   description = "instance_type"
#   type = string
#   default = "t2.micro"
# }

# variable "DevOps_VPC_public_subnets" {
#   description = "List of all public subnet in DevOps VPC"
#   type = list(string)
#   default = [ "subnet-0cbb96830e5c58494", "subnet-0bd78689999c66210" ]
# }

# variable "DevOps_VPC_private_subnets" {
#   description = "List of all private subnet in DevOps VPC"
#   type = list(string)
#   default = [ "subnet-00e864b918bf77e60", "subnet-06df2ed25e2eeb646" ]
# }

# variable "DevOps_VPC_security_group" {
#   description = "List of secirity groups in DevOps VPC"
#   type = list(string)
#   default = [ "sg-06cc896ca1da90f45", "sg-05bb976b04ce749d9", "sg-0bab5699acc6a7c21" ]
#   # OpenAllport, Openssh, emddi-off
# }

# variable "key_pair_name_list" {
#   description = "List of all existing key names"
#   type = list(string)
#   default = [ "emddi-devops", "svemddi", "gsm-dev" ]
# }

# variable "root_block_device" {
#   type = object({
#     volume_size = number
#     volume_type = string
#     encrypted   = bool
#   })

#   default = {
#     volume_size = 30
#     volume_type = "gp3"
#     encrypted   = false
#   }
# }



################################################################################
# Security Group
################################################################################

variable "vpc_id" {
  description = "VPC ID - Here is DevOps VPC"
  type = string
  default = "vpc-064dcbcd6a96c9398"
}





module "the_vars" {
  source = "./the_var"
  var_file = var.var_file
}

locals {
  configuration         = module.the_vars.configuration
  # global_variables      = module.the_vars.global_variables
  # global_tags           = module.the_vars.tags
}

variable "var_file" {
  type = string
  description = "The variable file to run"
}