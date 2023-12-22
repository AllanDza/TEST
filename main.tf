# main.tf

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "flask_instance" {
  ami           = "ami-0c7217cdde317cfec"  # Specify a suitable AMI for your region
  instance_type = "t2.micro"               # Choose an appropriate instance type

  key_name = var.key_name  # Name of the key pair for SSH access

  tags = {
    Name = "FlaskAppInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y python3-pip
              git clone https://github.com/AllanDza/TEST.git /home/ubuntu/flask-app
              cd /home/ubuntu/flask-app
              pip3 install -r requirements.txt
              python3 app.py
              EOF
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  # Change to your desired region
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
  default     = "your-key-pair-name"  # Replace with your actual key pair name
}
