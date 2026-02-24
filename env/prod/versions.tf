terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket                      = "iac-file"
    key                         = "koneksi-prod/terraform.tfstate"
    region                      = "us-east-1"
    endpoints                   = { s3 = "https://sgp1.digitaloceanspaces.com" }
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    force_path_style            = true
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.40.0"
    }
  }
}
