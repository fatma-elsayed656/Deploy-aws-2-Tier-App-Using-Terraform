# launch the ec2 instance in pub-sub-1-a
resource "aws_instance" "bastion_host" {
  ami                    = var.ami
  instance_type          = var.cpu
  subnet_id              = var.pub_sub_1a_id
  vpc_security_group_ids = [var.BASTION_SG_ID]
  key_name               = var.SSH_KEY

  tags = {
    Name = "Bastion_Host"
  }
}