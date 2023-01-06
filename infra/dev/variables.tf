variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
variable "instance_name" {
  description = "EC2 instance name"
  type        = string  
  default     = "micro-instance"
}