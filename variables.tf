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