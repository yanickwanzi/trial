################################################################################
# General Variables from root module
################################################################################

# variable "main-region" {
#   type = string
#   default = "us-west-2"
# }

################################################################################
# Variables from other Modules
################################################################################

variable "instance" {
  description = "ec2 instance name"
  type        = string
  default = "Jump_Host"
}

variable "instance_type" {
  description = "VPC Private Subnets which EKS cluster is deployed in"
  type        = string
  default = "t2.micro"
}

################################################################################
# Variables defined using Environment Variables
################################################################################

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
}

