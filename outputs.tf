output "vnet_name" {
  value = module.vnet.vnet_name
}

output "resource_group_id" {
  value = module.rg.resource_group_id
}
output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = module.rg.resource_group_name
}

output "subnet_id" {
  description = "The ID of the first subnet"
  value       = module.vnet.subnet_ids[0]
}

output "subnet_name" {
  description = "The name of the first subnet"
  value       = module.vnet.subnet_names[0]
}

output "region" {
  description = "The region/location where the resources are deployed"
  value       = var.location
}

output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = module.vm.vm_name
}

output "nic_name" {
  description = "The name of the Network Interface Card (NIC)"
  value       = module.nic.nic_name
}

output "keyvault_name" {
  description = "The name of the Azure Key Vault"
  value       = module.keyvault.keyvault_name
}

output "storage_account_name" {
  description = "The name of the Azure Storage Account"
  value       = module.blob_storage_account.storage_account_name
}

output "vm_private_ip" {
  description = "Private IP address of the Virtual Machine"
  value       = module.nic.private_ip_address
}

output "vm_public_ip" {
  description = "Public IP address of the Virtual Machine"
  value       = module.nic.public_ip_address
}

output "vm_os" {
  description = "Operating System of the Virtual Machine"
  value       = module.vm.os_offer
}

output "vm_size" {
  description = "Size (SKU) of the Virtual Machine"
  value       = module.vm.vm_size
}

output "vm_disk_size" {
  description = "OS Disk size of the Virtual Machine in GB"
  value       = module.vm.os_disk_size_gb
}
