output "droplet_ids" {
  value = [for d in digitalocean_droplet.this : d.id]
}

output "droplet_ips" {
  value = {
    for d in digitalocean_droplet.this :
    d.name => d.ipv4_address
  }
}

output "droplet_urns" {
  value = [for d in digitalocean_droplet.this : d.urn]
}