output "ec2_bastion_security_group_id" {
  value = aws_security_group.ec2_bastion.id
}

output "lambda_api_security_group_id" {
  value = aws_security_group.lambda_api.id
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}
