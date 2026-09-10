output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.crecita_server.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.crecita_server.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.crecita_sg.id
}
