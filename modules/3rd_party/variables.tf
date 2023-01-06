
variable "region" {
  description = "AWS region"
  type        = string
  # default     = "eu-central-1"
}
variable "s3_bucket_for_logs" {
  default = "bucket-for-alb-logs"
  description = "Bucket for storing ALB logs"
  type        = string
}

variable "vpc_id" {
  description = "Bucket for storing ALB logs"
  type        = string  
}
variable "subnets" {
  description = "Bucket for storing ALB logs"
  type        = list(string)  
}
variable "security_group_id" {
  description = "Bucket for storing ALB logs"
  type        = list(string)  
}
variable "ec2_instance_id" {
  description = "EC2 instance for ALB to be attached"
  type        = string  

}