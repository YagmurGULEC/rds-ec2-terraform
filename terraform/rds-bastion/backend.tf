terraform {

  backend "s3" {
    bucket = "your-s3-bucket-name"
    key    = "rds-bastion/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-locks"
  }
}
