variable project {
  default = "project"
}

variable region {
  default = "asia-east1"
}

variable zone {
  default = "asia-east1-b"
}

variable machine_type {
  type = string
  default = "e2-medium"
}

variable resource_tags {
  type = list(string)
  default = []
}

variable image {
  default = "centos-cloud/centos-7"
}

variable boot_disk_type {
  default = "pd-standard"
}

variable boot_disk_size {
  default = 20
}

variable labels {
  type = map(string)
  default = {}
}

variable servers {
  type = map
}

variable ansible_command {
  default = ""
}
