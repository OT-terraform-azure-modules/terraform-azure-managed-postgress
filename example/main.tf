module "posgress" {
  source                  = "../"
  name                    = var.name
  location                = data.terraform_remote_state.network_app.outputs.resource_group_location[0]
  resource_group_name     = data.terraform_remote_state.network_app.outputs.resource_group_name[0]
  virtual_network_name    = data.terraform_remote_state.network_app.outputs.vnet_name[1]
  subnet_address_prefixes = var.subnet_address_prefixes
  virtual_network_id      = data.terraform_remote_state.network_app.outputs.vnet_id[1]
  db_username             = var.db_username
  db_password             = var.db_password
  security_rule           = var.security_rule
  posgressversion         = var.posgressversion
  strorage_mb             = var.strorage_mb
  sku_name                = var.sku_name
  backup_retention_days   = var.backup_retention_days
  tags                    = var.tags
}