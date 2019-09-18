# WORK IN PROGRESS, NOT READY

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file

```terraform
resource "tls_private_key" "installkey" {
  algorithm = "RSA"
  rsa_bits = "2048"
}

module "infrastructure" {
    source             = "github.com/ncolon/terraform-openshift-userprovidedinfra.git?ref=v0.3"
    bastion_hostname   = "ocp-ncolon-3972bde1-bastion-01"
    bastion_public_ip  = "9.42.67.175"
    bastion_private_ip = "192.168.200.201"
    ssh_username       = "${var.ssh_user}"
    ssh_password       = "${var.ssh_password}"
    master_hostname    = [
      "ocp-ncolon-3972bde1-master-01",
      "ocp-ncolon-3972bde1-master-02",
      "ocp-ncolon-3972bde1-master-03"
    ]
    master_private_ip  = [
      "192.168.200.202",
      "192.168.200.203",
      "192.168.200.204",
    ]
    infra_hostname = [
      "ocp-ncolon-3972bde1-infra-01",
      "ocp-ncolon-3972bde1-infra-02",
      "ocp-ncolon-3972bde1-infra-03",
    ]
    infra_private_ip = [
      "192.168.200.205",
      "192.168.200.206",
      "192.168.200.207",
    ]
    worker_hostname = [
      "ocp-ncolon-3972bde1-worker-01",
      "ocp-ncolon-3972bde1-worker-02",
      "ocp-ncolon-3972bde1-worker-03",
    ]
    worker_private_ip = [
      "192.168.200.208",
      "192.168.200.209",
      "192.168.200.210",
    ]
    storage_hostname = [
      "ocp-ncolon-3972bde1-storage-01",
      "ocp-ncolon-3972bde1-storage-02",
      "ocp-ncolon-3972bde1-storage-03",
    ]
    storage_private_ip = [
      "192.168.200.211",
      "192.168.200.212",
      "192.168.200.213",
    ]
    ssh_private_key    = "${tls_private_key.installkey.private_key_pem}"
    ssh_public_key     = "${tls_private_key.installkey.public_key_openssh}"
}
```

## Module Inputs Variables

|Variable Name|Description|Default Value|
|-------------|-----------|-------------|
|bastion_hostname|Hostname for the Bastion VM|-|
|bastion_public_ip|Public IPv4 Address for the Bastion VM|-|
|master_hostname|List of Hostnames for the Master VMs|-|
|master_private_ip|List of Private IPv4 Addresses for the Master VMs|-|
|infra_hostname|List of hostnames for the Infra VMs|-|
|infra_private_ip|List of Private IPv4 Addresses for the Infra VMs|-|
|worker_hostname|List of hostnames for the Worker VMs|-|
|worker_private_ip|List of Private IPv4 Addresses for the Worker VMs|-|
|storage_hostname|List of hostnames for the GlusterFS VMs|-|
|storage_private_ip|List of Private IPv4 Addresses for the GlusterFS VMs|-|
|username|SSH User.  Must have passwordless sudo access|-|
|password|SSH Password|-|


## Module Output
|Variable Name|Description|Type
|-------------|-----------|-------------|
|bastion_hostname|Hostname for the Bastion VM|string|
|bastion_public_ip|Public IPv4 Address for the Bastion VM|string|
|bastion_private_ip|Private IPv4 Address for the Bastion VM|string|
|master_hostname|List of Hostnames for the Master VMs|list|
|master_private_ip|List of Private IPv4 Addresses for the Master VMs|list|
|infra_hostname|List of hostnames for the Infra VMs|list|
|infra_private_ip|List of Private IPv4 Addresses for the Infra VMs|list|
|worker_hostname|List of hostnames for the Worker VMs|list|
|worker_private_ip|List of Private IPv4 Addresses for the Worker VMs|list|
|storage_hostname|List of hostnames for the GlusterFS VMs|list|
|storage_private_ip|List of Private IPv4 Addresses for the GlusterFS VMs|list|


The infrastructure is already provided by your cloud or infrastructure administrator.  To use this module, you need to set the variables in `variables.tf` or `terraform.tfvars`
```
