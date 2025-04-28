variable "environment" {
  description = "The environment to deploy into"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}
variable "GITHUB_TOKEN" {
  description = "GitHub Token Admin"
  type        = string
}

variable "GITHUB_OWNER" {
  description = "GitHub Owner Organization"
  type        = string
}
variable "orgname" {
  description = "Organization Name"
  type        = string
}

variable "costcenter" {
  description = "Cost Center"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}
variable "default_tags" {
  description = "Default tags to be applied to all resources."
  type        = map(string)
  default     = {}
}

variable "tenant_id" {
  description = "The tenant ID for Azure."
  type        = string
}
variable "storage_os_disk" {
  description = "OS disk configuration"
  type = object({
    name              = string
    disk_size_gb      = number
    storage_type      = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  })
}

variable "storage_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "os_profile" {
  type = object({
    admin_username = string
    admin_password = string
  })
}
variable "admin_username" {
  description = "admin username variable"
  type        = string
}
# variable "admin_password" {
#   description = "admin password variable"
# }
variable "subnets" {
  description = "subnets variable"
}
variable "address_space" {
  description = "address_space variable"
}
