terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

locals {
  pg_names = [
    for i in range(var.postgres.count) :
    "${var.name_prefix}-pg-${i + 1}"
  ]

  mongo_names = [
    for i in range(var.mongodb.count) :
    "${var.name_prefix}-mongo-${i + 1}"
  ]
}

resource "digitalocean_database_cluster" "postgres" {
  for_each = toset(local.pg_names)

  name       = each.value
  engine     = "pg"
  version    = var.postgres.version
  size       = var.postgres.size
  region     = var.region
  node_count = var.postgres.nodes
  private_network_uuid = var.vpc_uuid

  tags = concat(var.tags, ["postgres"])
}

resource "digitalocean_database_cluster" "mongo" {
  for_each = toset(local.mongo_names)

  name       = each.value
  engine     = "mongodb"
  version    = var.mongodb.version
  size       = var.mongodb.size
  region     = var.region
  node_count = var.mongodb.nodes
  private_network_uuid = var.vpc_uuid

  tags = concat(var.tags, ["mongodb"])
}

resource "digitalocean_database_db" "postgres" {
  for_each   = digitalocean_database_cluster.postgres
  cluster_id = each.value.id
  name       = var.db_name
}

resource "digitalocean_database_db" "mongo" {
  for_each   = digitalocean_database_cluster.mongo
  cluster_id = each.value.id
  name       = var.db_name
}