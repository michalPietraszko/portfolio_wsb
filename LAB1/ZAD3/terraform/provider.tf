provider "aws" {
  access_key = "test"
  select_key = "test"
  region     = "us_east-1"

  s3_use_path_style = false
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

  endpoints {
    s3 = "http://s3.localhost.localstack.cloud:4566"
  }
}