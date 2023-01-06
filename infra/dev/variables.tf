variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_name" {
  description = "VPC instance name"
  type        = string
  default     = "education-vpc"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string  
  default     = "micro-instance"
}
