# module "vpc" {
#   source = "./modules/vpc"
#   # pass any required variables to the VPC module if necessary
#   azs = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
# }

################################################################################
# Instance - EC2
################################################################################

module "ec2" {
  source                 = "./modules/ec2"
  EC2_name               = local.configuration.ec2.EC2_name
  ami_id                 = local.configuration.ec2.ami_id
  instance_type          = local.configuration.ec2.instance_type
  subnet_id              = local.configuration.ec2.list_public_subnets[0]
  vpc_security_group_ids = local.configuration.ec2.DevOps_VPC_security_group
  key_name = local.configuration.ec2.list_key_pair_name[0]
  root_block_device = local.configuration.ec2.root_block_device

#   EC2_name               = "${var.EC2_name}"
#   ami_id                 = "${var.ami_id}"
#   instance_type          = "${var.instance_type}"
#   subnet_id              = "${var.DevOps_VPC_public_subnets[0]}"
#   vpc_security_group_ids = [var.DevOps_VPC_security_group[0], var.DevOps_VPC_security_group[1], var.DevOps_VPC_security_group[2]] // take all security group
#   key_name = "${var.key_pair_name_list[0]}"


#  root_block_device_config = var.root_block_device

#   vpc_id                 = module.vpc.vpc_id
#   subnet_id              = module.vpc.public_subnets[0] 
#   vpc_id                 = "vpc-62f3c50b"
#   vpc_security_group_ids = [module.security_group.ec2_security_group_id]

}


################################################################################
# Security Group
################################################################################

# module "security_group" {
  
# }
