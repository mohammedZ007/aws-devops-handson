aws_region       = "us-east-1"
environment      = "dev"
instance_type    = "t2.micro"
instance_name    = "crecita-server"
key_pair_name    = "your-key-pair-name"  # CHANGE THIS to your AWS key pair name
allowed_ssh_cidr = "0.0.0.0/0"           # CHANGE THIS to your IP for security
allowed_http_cidr = "0.0.0.0/0"
