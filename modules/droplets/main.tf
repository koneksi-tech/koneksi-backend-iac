terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "this" {
  count  = var.droplet_count
  name   = "${var.name_prefix}-${count.index + 1}"
  region = var.region
  size = (
    try(length(trimspace(var.droplet_size_list[count.index])) > 0, false)
    ? var.droplet_size_list[count.index]
    : var.size
  )
  image  = var.image

  ssh_keys = var.ssh_key_fingerprints
  user_data = (
    try(length(trimspace(var.user_data_list[count.index])) > 0, false)
    ? var.user_data_list[count.index]
    : var.user_data
  )
  vpc_uuid = var.vpc_uuid
  tags     = var.tags
}