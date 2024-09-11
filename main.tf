terraform {
  required_version = ">= 1.9.5"
}

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}


variable "ami_us_east_2" {
  description = "The AMI ID to use for the EC2 instances in east-2 Region"
  type        = string
}
variable "ami_us_west_2" {
  description = "The AMI ID to use for the EC2 instances in west-2 Region"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "instance_name_east" {
  description = "Iinstance in us-east-2 region"
  type        = string
  default     = "EastInstance"
}

variable "instance_name_west" {
  description = "Instance in us-west-2 region"
  type        = string
  default     = "WestInstance"
}

resource "aws_instance" "east_instance" {
  ami           = var.ami_us_east_2
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name_east
  }

}

resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = var.ami_us_west_2
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name_west
  }
}

output "east_instance_id" {
  description = "The ID of the EC2 instance in us-east-1"
  value       = aws_instance.east_instance.id
}

output "east_instance_public_ip" {
  description = "The public IP of the EC2 instance in us-east-1"
  value       = aws_instance.east_instance.public_ip
}

output "west_instance_id" {
  description = "The ID of the EC2 instance in us-west-2"
  value       = aws_instance.west_instance.id
}

output "west_instance_public_ip" {
  description = "The public IP of the EC2 instance in us-west-2"
  value       = aws_instance.west_instance.public_ip
}
