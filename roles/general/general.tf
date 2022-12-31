module "general-instance" {
    source = "../../modules"
    resource_tags = ["elk", "dev"]
    labels = {
        "env" = "dev"
        "proj" = "elk"
    }
    servers = {
        "gce-1" = { ip = "10.140.0.40", zone = "asia-east1-c" }
        "gce-2" = { ip = "10.140.0.50", zone = "asia-east1-c" }
    }
    ansible_command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../../ansible-playbook/inventory.instance.create.yml ../../ansible-playbook/create_general_instance.yaml"
}
