resource "digitalocean_droplet" "web" {
  image  = var.image           # Accessing the image variable
  name   = var.droplet_name    # Accessing the droplet_name variable
  region = var.region           # Accessing the region variable
  size   = var.size       
  ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
  ]

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }


  provisioner "local-exec" {
    command = <<EOT
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' playbook.yaml
    EOT
  }
}
 
output "instance_public_ip" {
  description = "Public IP of DO instance"
  value       = digitalocean_droplet.web.ipv4_address
}

 





