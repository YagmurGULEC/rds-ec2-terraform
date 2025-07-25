terraform {

  backend "s3" {
    bucket = "terraform-state-storage-all"
    key    = "rds-bastion/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-locks"
  }
}
