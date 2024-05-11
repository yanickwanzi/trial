
################################################################################
# Default Variables
################################################################################

variable "profile" {
  type    = string
  default = ""
}

variable "main-region" {
  type    = string
  default = "us-west-2"
}


################################################################################
# EKS Cluster Variables
################################################################################

variable "cluster_name" {
  type    = string
  default = "tf-cluster"
}

variable "rolearn" {
  description = "Add admin role to the aws-auth configmap"
  default = "arn:aws:iam::322266404742:user/Ndiforamang_Fusi"
}

################################################################################
# ALB Controller Variables
################################################################################

variable "env_name" {
  type    = string
  default = "dev"
}

