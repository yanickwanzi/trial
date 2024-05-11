module "eks-module" {
  source = "../modules/eks-cluster"
}

# module "aws-alb-controller-module" {
#   source = "../modules/aws-alb-controller"
#   oidc_provider_arn = "arn:aws:iam::322266404742:oidc-provider/oidc.eks.us-west-2.amazonaws.com/id/2174FB34E7D8D5A1DA8F3F6A5171E33C"
#   cluster_name = module.eks-module.cluster_name
#   vpc_id = module.eks-module.vpc_id
# }