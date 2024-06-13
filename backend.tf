terraform {
  backend "s3" {
    bucket = "terraform-2tier-app-tfstate"
    key    = "backend/deploy-2-tier-App.tfstate"
    region = "us-east-1"
    dynamodb_table = "remote-backend"
  }
}