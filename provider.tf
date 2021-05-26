terraform {
  backend "local" {}
  required_providers {
    aws = {
      version = "=3.42.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                      = "eu-central-1"
  s3_force_path_style         = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    lambda         = "http://host.docker.internal:4566"
    s3             = "http://host.docker.internal:4566"
  }
}