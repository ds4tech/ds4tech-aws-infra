module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.subnets
  security_groups    = var.security_group_id

  access_logs = {
    bucket = var.s3_bucket_for_logs
  }

#   target_groups = [
#     {
#       name_prefix      = "pref-"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#       targets = {
#         my_target = {
#           target_id = "i-0123456789abcdefg"
#           port = 80
#         }
#         my_other_target = {
#           target_id = "i-a1b2c3d4e5f6g7h8i"
#           port = 8080
#         }
#       }
#     }
#   ]
  target_groups = [
    {
      name_prefix          = "h1"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      targets = {
        my_ec2 = {
          target_id = var.ec2_instance_id
          port      = 80
        },
      }
      tags = {
        InstanceTargetGroupTag = "baz"
      }
    },
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      # action_type        = "forward"
    },
    {
      port               = 81
      protocol    = "HTTP"
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message"
        status_code  = "200"
      }
    }
  ]

  tags = local.tags
}