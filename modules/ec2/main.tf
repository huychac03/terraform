

resource "aws_instance" "ec2_1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  # subnet_id     = var.subnet_id
  # vpc_security_group_ids = var.vpc_security_group_ids
  # # subnet_id     = var.public_subnet_cidrs[0]
  # key_name      = var.key_name


  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids // take all security group
  key_name = var.key_name

  root_block_device {
    volume_size = var.root_block_device["volume_size"]
    volume_type = var.root_block_device["volume_type"]
    encrypted   = var.root_block_device["encrypted"]
  }
  
#   user_data     = file("${path.module}/install_new_nodejs_app.sh")
  tags = {
    Name = var.EC2_name
  }
}
 

