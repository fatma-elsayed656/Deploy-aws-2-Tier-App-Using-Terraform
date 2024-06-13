output "ALB_SG_ID" {
  value = aws_security_group.alb_sg.id
}

output "WEB_SG_ID" {
  value = aws_security_group.web_sg.id
}

output "DB_SG_ID" {
  value = aws_security_group.db_sg.id
}
output "BASTION_SG_ID" {
  value = aws_security_group.bastion_sg.id
}