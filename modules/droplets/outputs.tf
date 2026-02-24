output "droplet_ids" {
  value = [for d in digitalocean_droplet.this : d.id]
}

output "droplet_ips" {
  value = {
    for d in digitalocean_droplet.this :
    d.name => d.ipv4_address
  }
}

output "reserved_ip_addresses" {
  value = {
    for idx, i in digitalocean_reserved_ip.this :
    digitalocean_droplet.this[idx].name => i.ip_address
  }
}

output "droplet_urns" {
  value = [for d in digitalocean_droplet.this : d.urn]
}

output "reserved_ip_urns" {
  value = [for i in digitalocean_reserved_ip.this : i.urn]
}