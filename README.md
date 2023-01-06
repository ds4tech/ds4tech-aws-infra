# To BE corrected

This project will create a VCP with Internet Gateway, subnets accross 2 AZs: one public and one one private.



## High level diagram

![Diagram](img/demo-tform-aws-vpc.png)

## Modules
VPC <br />
Security rules <br />
S3 <br />
IAM <br />

APIGW <br />
ALB <br />
EC2 <br />

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| namespace | The project namespace to use for unique resource naming | `string` | `"LL-TEST"` | no |
| region | AWS region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_connection\_string | Copy/Paste/Enter - You are in the private ec2 instance |
| public\_connection\_string | Copy/Paste/Enter - You are in the matrix |
