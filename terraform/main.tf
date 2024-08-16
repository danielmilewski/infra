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

resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-18-04-x64"
  name      = "terramino"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = file("terramino_app.yaml")
}
