# This module is only responsible for generating and copying ssh key files to bastion host
# TODO
# 1. generate ssh key
# 2. copy ssh key to hosts

locals {
    all_nodes = "${concat(
        "${var.master_private_ip}",
        "${var.infra_private_ip}",
        "${var.worker_private_ip}",
        "${var.storage_private_ip}"
    )}"
    all_count = "${length(local.all_nodes)}"
}

resource "null_resource" "copy_keys_bastion" {
    connection {
        type         = "ssh"
        host         = "${var.bastion_public_ip}"
        user         = "${var.ssh_username}"
        password     = "${var.ssh_password}"
    }

    provisioner "file" {
        source = "${path.module}/scripts"
        destination = "/tmp/terraform_scripts/"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod u+x /tmp/terraform_scripts/*.sh",
            "/tmp/terraform_scripts/add-private-ssh-key.sh \"${var.ssh_private_key}\" \"${var.ssh_username}\"",
            "/tmp/terraform_scripts/add-public-ssh-key.sh \"${var.ssh_public_key}\""
        ]
    }
}

resource "null_resource" "copy_keys_nodes" {
    count = "${local.all_count}"
    connection {
        type         = "ssh"
        host         = "${element(local.all_nodes, count.index)}"
        user         = "${var.ssh_username}"
        password     = "${var.ssh_password}"
        bastion_host = "${var.bastion_public_ip}"
    }

    provisioner "file" {
        source = "${path.module}/scripts"
        destination = "/tmp/terraform_scripts/"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod u+x /tmp/terraform_scripts/*.sh",
            "/tmp/terraform_scripts/add-public-ssh-key.sh \"${var.ssh_public_key}\""
        ]
    }
}