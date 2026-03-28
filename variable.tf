variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name of EC2 instance"
  type = string
  default = "Web Sport Rental System"
}

variable "key_name" {
  description = "AWS key pair name"
  type = string
}