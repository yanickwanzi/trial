
provider "aws" {
  profile = var.profile
  region  = var.main-region
  alias   = "shi-awslab"
}

