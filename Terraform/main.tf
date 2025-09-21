terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch all public subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

# Security Group for SSH, HTTP, and microservice ports
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-basic-sg"
  description = "Allow SSH, HTTP, and microservice ports"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Frontend HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Microservices"
    from_port   = 3001
    to_port     = 3004
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance with Docker and containers
resource "aws_instance" "ecom-store-ak" {
  ami           = var.ami_id
  instance_type = var.instance_type
  #subnet_id     = data.aws_subnets.default.ids[0]
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  #security_groups = [aws_security_group.ec2_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              
              docker network create ecom-net

              docker run -d --name mongo --network ecom-net -p 27017:27017 -v /var/lib/mongo-data:/data/db mongo

              docker pull amolkhetan/user-service:latest
              docker pull amolkhetan/product-service:latest
              docker pull amolkhetan/cart-service:latest
              docker pull amolkhetan/order-service:latest
              docker pull amolkhetan/frontend:latest

              docker run -d -p 80:80 amolkhetan/frontend:latest
              
              docker run -d -p 3001:3001 --name user-service --network ecom-net  -e MONGODB_URI="mongodb://mongo:27017/ecommerce_users"   amolkhetan/user-service:latest
              docker run -d -p 3002:3002 --name product-service --network ecom-net -e MONGODB_URI="mongodb://mongo:27017/ecommerce_products" amolkhetan/product-service:latest
              docker run -d -p 3003:3003 --name cart-service --network ecom-net -e MONGODB_URI="mongodb://mongo:27017/ecommerce_carts" amolkhetan/cart-service:latest
              docker run -d -p 3004:3004 --name order-service --network ecom-net -e MONGODB_URI="mongodb://mongo:27017/ecommerce_orders" amolkhetan/order-service:latest           
              EOF

  tags = {
    Name = "Ecom-Ak"
  }
}
