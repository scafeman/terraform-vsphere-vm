
# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = var.user
  password       = var.password
  vsphere_server = var.vsphere_server

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

variable "user" {
  description = "The username to login to vCenter"  
}

variable "password" {
  description = "The password to login to vCenter"  
}

variable "vsphere_server" {
  description = "The vCenter server to login to"  
}