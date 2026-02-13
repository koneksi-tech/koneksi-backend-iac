output "postgres_uris" {
  sensitive = true
  value = {
    for k, v in digitalocean_database_cluster.postgres :
    k => v.uri
  }
}

output "mongo_uris" {
  sensitive = true
  value = {
    for k, v in digitalocean_database_cluster.mongo :
    k => v.uri
  }
}

output "postgres_ids" {
  value = {
    for k, v in digitalocean_database_cluster.postgres :
    k => v.id
  }
}

output "mongo_ids" {
  value = {
    for k, v in digitalocean_database_cluster.mongo :
    k => v.id
  }
}

output "postgres_urns" {
  value = {
    for k, v in digitalocean_database_cluster.postgres :
    k => v.urn
  }
}

output "mongo_urns" {
  value = {
    for k, v in digitalocean_database_cluster.mongo :
    k => v.urn
  }
}