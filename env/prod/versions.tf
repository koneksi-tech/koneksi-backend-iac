terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket                      = "iac-file"
    key                         = "koneksi-prod/terraform.tfstate"
    region                      = "sgp1"
    endpoint                    = "https://sgp1.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.40.0"
    }
  }
}
