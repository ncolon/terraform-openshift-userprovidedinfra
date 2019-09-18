variable "bastion_hostname" {}
variable "bastion_public_ip" {}
variable "bastion_private_ip" {}
variable "master_hostname"   { type = "list" }
variable "master_private_ip" { type = "list" }
variable "infra_hostname"    { type = "list" }
variable "infra_private_ip"  { type = "list" }
variable "worker_hostname"   { type = "list" }
variable "worker_private_ip" { type = "list" }
variable "storage_hostname"  {
    type = "list"
    default = []
}
variable "storage_private_ip" {
    type = "list"
    default = []
}

variable "ssh_username" {}
variable "ssh_password" {}
variable "ssh_private_key" {}
variable "ssh_public_key" {}
