module "rg" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-rg-module.git"
  resource_group_name = "rg-${var.orgname}-${terraform.workspace}"
  location            = var.location
  orgname             = var.orgname
  environment         = terraform.workspace
  costcenter          = var.costcenter
  default_tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )
}

module "vnet" {
  source        = "git::https://github.com/chaitanyakommoju/iac-az-vnet-module.git"
  vnet_name     = "vnet-${var.orgname}-${terraform.workspace}"
  address_space = ["10.0.0.0/16"]
  subnets = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.0.2.0/24"
    }
  ]
  orgname             = var.orgname
  region              = var.location
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )

  depends_on = [module.rg]
}

module "keyvault" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-keyvault-module.git"
  keyvault_name       = "kv-${var.orgname}-${terraform.workspace}"
  orgname             = var.orgname
  region              = var.location
  tenant_id           = var.tenant_id
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )

  depends_on = [module.vnet]
}

module "blob_storage_account" {
  source               = "git::https://github.com/chaitanyakommoju/iac-az-storage-module.git"
  storage_account_name = "st${var.orgname}${terraform.workspace}"
  orgname              = var.orgname
  environment          = terraform.workspace
  location             = var.location
  region               = var.location
  resource_group_name  = module.rg.resource_group_name
  account_kind         = "StorageV2"
  account_tier         = "Standard"
  tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )

  depends_on = [module.keyvault]
}
module "vm" {
  source = "git::https://github.com/chaitanyakommoju/iac-az-vm-module.git"

  vm_name              = "vm-${var.orgname}-${terraform.workspace}"
  resource_group_name  = module.rg.resource_group_name
  location             = var.location
  network_interface_id = module.nic.id
  vm_size              = "Standard_DS1_v2"

  storage_os_disk = {
    name              = "os-disk-${var.orgname}-${terraform.workspace}"
    disk_size_gb      = 128
    storage_type      = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  storage_image_reference = var.storage_image_reference
  os_profile              = var.os_profile

  tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )

  depends_on = [
    module.rg,
    module.vnet,
    module.nic
  ]

}
module "nic" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-nic-module.git"
  nic_name            = "nic-${var.orgname}-${terraform.workspace}"
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  subnet_id           = module.vnet.subnet_ids[0]
  tags = merge(
    var.default_tags,
    {
      org        = var.orgname
      region     = var.location
      env        = terraform.workspace
      costcenter = var.costcenter
    }
  )

  depends_on = [
    module.vnet,
    module.rg
  ]
}
