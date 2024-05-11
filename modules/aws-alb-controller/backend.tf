terraform {
  backend "s3" {
    bucket = "fusisoft-terraform-backend-bucket"
    key    = "aws-al-controller"
    region = "us-west-2"
    dynamodb_table = "terraform-state-locking"
  }
}
