output "DC_ID" {
  description = "id of vSphere Datacenter"
  value       = data.vsphere_datacenter.dc.id
}

output "ResPool_ID" {
  description = "Resource Pool id"
  value       = var.vmrp != "" ? data.vsphere_resource_pool.pool[0].id : var.vmrpid
}

output "VM" {
  description = "VM Names"
  value       = vsphere_virtual_machine.vm.*.name
}

output "ip" {
  description = "default ip address of the deployed VM"
  value       = vsphere_virtual_machine.vm.*.default_ip_address
}

output "customization_spec_type" {
  description = "The type of customization specification."
  value       = var.use_customization_spec ? data.vsphere_guest_os_customization.custom_spec[0].type : ""
}

output "customization_spec_last_update" {
  description = "The last update time of the customization specification."
  value       = var.use_customization_spec ? data.vsphere_guest_os_customization.custom_spec[0].last_update_time : ""
}

output "guest-ip" {
  description = "all the registered ip address of the VM"
  value       = vsphere_virtual_machine.vm.*.guest_ip_addresses
}

output "uuid" {
  description = "UUID of the VM in vSphere"
  value       = vsphere_virtual_machine.vm.*.uuid
}

output "disk" {
  description = "Disks of the deployed VM"
  value       = vsphere_virtual_machine.vm.*.disk
}
