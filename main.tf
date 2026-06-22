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

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "daddy-app-${var.environment}-bucket"

  tags = {
    Name        = "My App Bucket"
    Environment = var.environment
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.my_bucket.bucket
  description = "The name of the S3 bucket"
}
