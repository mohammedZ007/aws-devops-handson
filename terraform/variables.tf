variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01a00762f46d584a1"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "crecita-server"
}

variable "key_pair_name" {
  description = "Name of the SSH key pair for EC2 access"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access (change to your IP for security)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed for HTTP access"
  type        = string
  default     = "0.0.0.0/0"
}
