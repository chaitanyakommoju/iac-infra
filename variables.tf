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
  type = object({
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

variable "default_tags" {
  type = map(string)
}