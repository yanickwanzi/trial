################################################################################
# General Variables from root module
################################################################################


variable "env_name" {
  type    = string
  default = "Dev"
}

variable "cluster_name" {
  type    = string
}

################################################################################
# Variables from other Modules
################################################################################

variable "vpc_id" {
  description = "VPC ID which Load balancers will be  deployed in"
  type = string
  default = ""
}

variable "oidc_provider_arn" {
  description = "OIDC Provider ARN used for IRSA "
  type = string
  default = "module.eks.oidc_provider_arn.arn"
}
