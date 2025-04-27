module "vnet" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-vnet-module.git"
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.resource_group_name

  tags = merge(
    var.default_tags,
    {
      org       = var.orgname
      region    = var.location
      env       = terraform.workspace
      costcenter = var.costcenter
    }
  )
}

module "blob" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-blob-module.git"
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.resource_group_name

  tags = merge(
    var.default_tags,
    {
      org       = var.orgname
      region    = var.location
      env       = terraform.workspace
      costcenter = var.costcenter
    }
  )
}

module "keyvault" {
  source              = "git::https://github.com/chaitanyakommoju/iac-az-keyvault-module.git"
  environment         = var.environment
  location            = var.location
  resource_group_name = module.rg.resource_group_name

  tags = merge(
    var.default_tags,
    {
      org       = var.orgname
      region    = var.location
      env       = terraform.workspace
      costcenter = var.costcenter
    }
  )
}

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
      org       = var.orgname
      region    = var.location
      env       = terraform.workspace
      costcenter = var.costcenter
    }
  )
}

output "resource_group_name" {
  value = module.rg.resource_group_name
}
