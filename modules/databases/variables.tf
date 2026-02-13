variable "name_prefix" { type = string }
variable "region"      { type = string }

variable "postgres" {
  type = object({
    count   = number
    version = string
    size    = string
    nodes   = number
  })
}

variable "mongodb" {
  type = object({
    count   = number
    version = string
    size    = string
    nodes   = number
  })
}

variable "db_name" {
  type    = string
  default = "koneksi"
}

variable "vpc_uuid" {
  type    = string
  default = null
}

variable "tags" {
  type    = list(string)
  default = []
}