## Abstract
This article provide guidelines and considerations to provision the User Provided Infrastructure to deploy a reference implementation of Red Hat® OpenShift Container Platform 3.

Refer to https://github.com/IBMTerraform/terraform-ibm-openshift/blob/master/docs/02-Deploy-OpenShift.md to Deploy & Manage the Red Hat® OpenShift Container Platform on IBM Cloud.

# Phase 1: Provision Infrastructure

# WORK IN PROGRESS, NOT READY

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file

```terraform
module "infrastructure" {
    source             = "github.com/ncolon/terraform-openshift-userprovidedinfra.git?ref=v0.2"
    bastion_hostname   = "${var.bastion_hostname}"
    bastion_public_ip  = "${var.bastion_public_ip}"
    master_hostname    = "${var.master_hostname}"
    master_private_ip  = "${var.master_private_ip}"
    infra_hostname     = "${var.infra_hostname}"
    infra_private_ip   = "${var.infra_private_ip}"
    worker_hostname    = "${var.worker_hostname}"
    worker_private_ip  = "${var.worker_private_ip}"
    storage_hostname   = "${var.storage_hostname}"
    storage_private_ip = "${var.storage_private_ip}"
    password           = "${var.password}"
    username           = "${var.username}"
    public_master_vip  = "${var.public_master_vip}"
    public_app_vip     = "${var.public_app_vip}"
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
|public_master_vip|DNS CNAME for Master Cluster|-|
|public_app_vip|DNS CNAME for Apps Cluster ex:`apps.example.com`|-|


## Module Output
|Variable Name|Description|Type
|-------------|-----------|-------------|
|bastion_hostname|Hostname for the Bastion VM|string|
|bastion_public_ip|Public IPv4 Address for the Bastion VM|string|
|master_hostname|List of Hostnames for the Master VMs|list|
|master_private_ip|List of Private IPv4 Addresses for the Master VMs|list|
|infra_hostname|List of hostnames for the Infra VMs|list|
|infra_private_ip|List of Private IPv4 Addresses for the Infra VMs|list|
|worker_hostname|List of hostnames for the Worker VMs|list|
|worker_private_ip|List of Private IPv4 Addresses for the Worker VMs|list|
|storage_hostname|List of hostnames for the GlusterFS VMs|list|
|storage_private_ip|List of Private IPv4 Addresses for the GlusterFS VMs|list|
|username|SSH User.  Must have passwordless sudo access|string|
|password|SSH Password|string|
|public_master_vip|DNS CNAME for Master Cluster|string|
|public_app_vip|DNS CNAME for Apps Cluster ex:`apps.example.com`|string|


The infrastructure is already provided by your cloud or infrastructure administrator.  To use this module, you need to set the variables in `variables.tf` or `terraform.tfvars`

## Sample Variables in your variable.tf files
```terraform
bastion_hostname = "ocp-vmware-bastion-01"
bastion_public_ip = "9.42.67.175"

infra_hostname = [
    "ocp-vmware-infra-01"
]

infra_private_ip = [
    "192.168.200.203"
]


master_hostname = [
    "ocp-vmware-master-01"
]


master_private_ip = [
    "192.168.200.202",
]


storage_hostname = [
    "ocp-vmware-storage-01",
    "ocp-vmware-storage-02",
    "ocp-vmware-storage-03"
]

storage_private_ip = [
    "192.168.200.207",
    "192.168.200.208",
    "192.168.200.209"
]

worker_hostname = [
    "ocp-vmware-worker-01",
    "ocp-vmware-worker-02",
    "ocp-vmware-worker-03"
]

worker_private_ip = [
    "192.168.200.204",
    "192.168.200.205",
    "192.168.200.206"
]

public_master_vip = "ocp-vmware-master.rtp.raleigh.ibm.com"
public_app_vip = "ocp-vmware-apps.rtp.raleigh.ibm.com"
username = "root"
password = "mySecretPassw0rd"
```
