terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.40.0"
    }
  }
}


terraform{
 backend "remote"{
  organization = "infra-test-90"
  workspace{
  name = "infra"
  }
 }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
