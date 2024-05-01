terraform {
  backend "s3" {
    bucket = "fusisoft-terraform-backend"
    key    = "infra_resources/terraform.tfstate"
    region = "us-west-3"
    dynamodb_table = "s3-state-lock"
  }
}
