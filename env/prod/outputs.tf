output "droplet_ips" {
  value = module.droplets.droplet_ips
}

output "postgres_uris" {
  sensitive = true
  value     = module.databases.postgres_uris
}

output "mongo_uris" {
  sensitive = true
  value     = module.databases.mongo_uris
}

output "app_live_urls" {
  value = module.apps.app_live_urls
}