terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}


data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}

output "droplet_ip_address" {
  value = digitalocean_droplet.web.ipv4_address
  description = "Public IP of EC2 instance"
}

