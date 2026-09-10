# Security Group for Crecita Server
resource "aws_security_group" "crecita_sg" {
  name_prefix = "crecita-sg-"
  description = "Security group for Crecita React server"

  tags = {
    Name = "crecita-sg"
  }
}

# Allow SSH (port 22)
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.crecita_sg.id
  description       = "Allow SSH access"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.allowed_ssh_cidr

  tags = {
    Name = "allow-ssh"
  }
}

# Allow HTTP (port 3000 for React app)
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.crecita_sg.id
  description       = "Allow HTTP access on port 3000 for React app"
  from_port         = 3000
  to_port           = 3000
  ip_protocol       = "tcp"
  cidr_ipv4         = var.allowed_http_cidr

  tags = {
    Name = "allow-http-3000"
  }
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.crecita_sg.id
  description       = "Allow all outbound traffic"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "allow-all-outbound"
  }
}

# EC2 Instance for Crecita Server
resource "aws_instance" "crecita_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.crecita_sg.name]

  # Enable public IP
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  # Metadata options for IMDSv2
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  depends_on = [aws_security_group.crecita_sg]
}
