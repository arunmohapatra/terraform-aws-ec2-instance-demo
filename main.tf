terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  alias  = "aws_us_east_1"
}

variable "ami" {
  type = string
}


variable "instancetype" {
   type = string
}


resource "aws_instance" "my_instance" {

    ami = var.ami
    instance_type = var.instancetype
    provider = aws.aws_us_east_1
}

output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}