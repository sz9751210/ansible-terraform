project = "coral-bucksaw-305307"
region = "us-central1"
zone = "us-central1-c"
machine_type = "e2-medium"
resource_tags = ["elk", "dev"]
image = "centos-cloud/centos-7"
boot_disk_type = "pd-standard"
boot_disk_size = 30
labels = {
  "env" = "dev"
  "proj" = "elk"
}
servers = {

online = {
  "name"   = "redis-online"
  count = 1
},
cache = {
  "name"   = "redis-cache"
  count = 2
}
}
