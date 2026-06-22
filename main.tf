terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

resource "aws_instance" "ec2" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = var.instance_type
  tags = {
    Name = "my_server"
  }
}

output "server_id" {
  value = aws_instance.ec2.id
}
