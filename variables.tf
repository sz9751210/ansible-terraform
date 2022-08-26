variable "project" {
    type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "resource_tags" {
  type = list(string)
}

variable "image" {
    type = string
}

variable "boot_disk_type" {
  type = string
}

variable "boot_disk_size" {
  type = string
}

variable "labels" {
  type = map(string)
}

variable "servers" {
  type = map(any)
}

# variable "server2" {
#   type = map(string)
# }
# variable "name" {
#   type = string
# }