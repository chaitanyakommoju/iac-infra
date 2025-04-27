locals {
  environment = terraform.workspace
  labels = {
    org        = var.orgname
    region     = var.region
    env        = local.environment
    costcenter = var.costcenter
  }
}
