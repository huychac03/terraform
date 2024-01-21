# variable "ami_id" {
#   description = "The ID of the AMI to use for the instance"
#   type = string
#   default = "ami-0fa377108253bf620"
# }

# variable "instance_type" {
#   description = "The instance type to launch"
#   type = string
#   default     = "t2.micro"
# }

# variable "vpc_id" {
#   description = "The ID of VPC <don't have to declare. Just write here to know>"
#   type = list(string)
#   default = [ "vpc-064dcbcd6a96c9398", "vpc-03cb4a3e8a551126b", "vpc-00f7f199a7888f237", "vpc-c783e7a3", "vpc-05861fb6206fd7575" ]
# }

# variable "subnet_id" {
#   description = "The ID of the subnet to launch the instance in"
#   type = string
# }
# // Default sẽ là public subnet nếu muốn đổi sang private thì đổi 

# variable "vpc_security_group_ids" {
#   description = "A list of security group IDs to associate with"
#   type        = list(string)
# }

# variable "EC2_name" {
#   description = "The name of EC2"
#   type = string
#   default = "new-EC2"
# }

# variable "key_name" {
#   description = "Key pair name"
#   type = string
# }

# variable "root_block_device_config" {
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
# Instance - EC2
################################################################################

variable "EC2_name" {
  description = "EC2 name"
  type = string
  # default = "New-EC2-created-by-Terraform_Not_What_I_Want"
}

variable "ami_id" {
  description = "ami_id"
  type = string
  # default = "ami-0fa377108253bf620"
}

variable "instance_type" {
  description = "instance_type"
  type = string
  # default = "t2.micro"
}

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

variable "subnet_id" {
  description = "Subnet for EC2"
  type = string
}

variable "vpc_security_group_ids" {
  description = "Security groups"
  type = list(string)
}

variable "key_name" {
  description = "Key Name"
  type = string
}

variable "root_block_device" {
  type = object({
    volume_size = number
    volume_type = string
    encrypted   = bool
  })

  # default = {
  #   volume_size = 30
  #   volume_type = "gp3"
  #   encrypted   = false
  # }
}
