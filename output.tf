
output "bastion_hostname" {
    value = "${var.bastion_hostname}"
}

output "bastion_public_ip" {
    value = "${var.bastion_public_ip}"
}

output "bastion_private_ip" {
    value = "${var.bastion_public_ip}"
}

output "infra_hostname" {
    value = "${var.infra_hostname}"
}

output "infra_private_ip" {
    value = "${var.infra_private_ip}"
}

output "master_hostname" {
    value = "${var.master_hostname}"
}

output "master_private_ip" {
    value = "${var.master_private_ip}"
}

output "storage_hostname" {
    value = "${var.storage_hostname}"
}

output "storage_private_ip" {
    value = "${var.storage_private_ip}"
}

output "worker_hostname" {
    value = "${var.worker_hostname}"
}

output "worker_private_ip" {
    value = "${var.worker_private_ip}"
}
