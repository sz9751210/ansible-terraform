project = "coral-bucksaw-305307"
region = "asia-east1"
zone = "asia-east1-c"
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

elastic-1  = { "name"   = "elastic-1",  ip = "10.128.0.4", zone = "us-central1-c" },
elastic-2  = { "name"   = "elastic-2",  ip = "10.128.0.5", zone = "us-central1-b" },
elastic-3  = { "name"   = "elastic-3",  ip = "10.128.0.6", zone = "us-central1-a" },
logstash-1 = { "name"   = "logstash-1", ip = "10.128.0.7", zone = "us-central1-c" }
kibana-1   = { "name"   = "kibana-1",   ip = "10.128.0.8", zone = "us-central1-c" }

}
