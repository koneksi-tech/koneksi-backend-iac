variable "name_prefix" { type = string }
variable "region"      { type = string }
variable "droplet_count" { type = number }
variable "size"        { type = string }
variable "image"       { type = string }

variable "ssh_key_fingerprints" {
  type    = list(string)
  default = []
}

variable "user_data" {
  type    = string
  default = null
}

variable "user_data_list" {
  type    = list(string)
  default = []
}

variable "vpc_uuid" {
  type    = string
  default = null
}

variable "tags" {
  type    = list(string)
  default = []
}