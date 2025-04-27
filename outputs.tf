output "vnet_name" {
  value = module.vnet.vnet_name
}

output "blob_name" {
  value = module.blob.blob_name
}

output "keyvault_name" {
  value = module.keyvault.keyvault_name
}
# output "resource_group_name" {
#   value = module.rg.resource_group_name
# }

output "resource_group_id" {
  value = module.rg.resource_group_id
}
