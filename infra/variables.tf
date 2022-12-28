
variable "s3_bucket_for_logs" {
  default = "bucket-for-alb-logs"
  description = "Bucket for storing ALB logs"
  type        = string
}

