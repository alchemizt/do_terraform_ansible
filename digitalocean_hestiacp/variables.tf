variable "do_token" {
  description = "Path to the private SSH key for connecting to the droplet."
  type        = string
}


variable "pvt_key" {
  description = "Path to the private SSH key for connecting to the droplet."
  type        = string
}

variable "pub_key" {
  description = "Public SSH key to be added to the droplet."
  type        = string
}

variable "droplet_name" {
  description = "Name of the DigitalOcean droplet."
  type        = string
  default     = "newserver"  # You can change the default value as needed
}

variable "region" {
  description = "Region for the DigitalOcean droplet."
  type        = string
  default     = "sfo3"       # Default region can be changed
}

variable "image" {
  description = "Image for the DigitalOcean droplet."
  type        = string
  default     = "ubuntu-22-04-x64"  # Default image
}

variable "size" {
  description = "Size of the DigitalOcean droplet."
  type        = string
  default     = "s-1vcpu-1gb"  # Default size
}
