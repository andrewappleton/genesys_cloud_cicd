terraform {
  cloud {
    organization = "ara_genesys_cloud_cicd"
    workspaces {
      name = "genesys_cloud_cicd"
    }
  }
  required_providers {
    genesyscloud = {
      source = "mypurecloud/genesyscloud"
      version = ">=1.50.0"
    }
  }
}