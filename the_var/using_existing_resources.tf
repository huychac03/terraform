################################################################################
# Instance - EC2
################################################################################

locals {
  using_existing_resources = {
    ec2 = {
      EC2_name = "New-EC2-created-by-Terraform"
      ami_id = "ami-0fa377108253bf620"
      instance_type = "t2.micro"
      list_public_subnets = [ "subnet-0cbb96830e5c58494", "subnet-0bd78689999c66210" ]
      public_subnet = "subnet-0cbb96830e5c58494"
      list_private_subnets = [ "subnet-00e864b918bf77e60", "subnet-06df2ed25e2eeb646" ]
      private_subnet = "subnet-00e864b918bf77e60"
      DevOps_VPC_security_group = [ "sg-06cc896ca1da90f45", "sg-05bb976b04ce749d9", "sg-0bab5699acc6a7c21" ]
      list_key_pair_name = [ "emddi-devops", "svemddi", "gsm-dev" ]
      key_name = "emddi-devops"
      root_block_device = {
          volume_size = 30
          volume_type = "gp3"
          encrypted   = false
      }
    }
  }
}
