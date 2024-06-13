output "BASTION_HOST_IP" {
  value = aws_instance.bastion_host.public_ip
}