variable "bastion_hostname" {}
variable "bastion_public_ip" {}
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
variable "password" {}
variable "username" {}


variable "public_master_vip" {}

variable "public_app_vip" {}
