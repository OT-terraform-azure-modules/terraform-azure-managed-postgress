resource "azurerm_network_security_group" "default" {
  name                = "${var.name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = [var.security_rule]
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet" "default" {
  name                 = "${var.name}-subnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = var.service_endpoints 

  delegation {
    name = var.delegation_name

    service_delegation {
      name = var.service_delegation
      actions = var.action
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

resource "azurerm_private_dns_zone" "default" {
  name                = "${var.name}-pdz.postgres.database.azure.com"
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_subnet_network_security_group_association.default]
}

resource "azurerm_private_dns_zone_virtual_network_link" "default" {
  name                  = "${var.name}-pdzvnetlink.com"
  private_dns_zone_name = azurerm_private_dns_zone.default.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "default" {
  name                   = "${var.name}-server"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.posgressversion
  delegated_subnet_id    = azurerm_subnet.default.id
  private_dns_zone_id    = azurerm_private_dns_zone.default.id
  administrator_login    = var.db_username
  administrator_password = var.db_password
  tags = merge(
  {
    "Name" = "${var.name}-server"
  },
  var.tags,
)
  
              
  storage_mb             = var.strorage_mb 
  sku_name               = var.sku_name 
  backup_retention_days  = var.backup_retention_days

  depends_on = [azurerm_private_dns_zone_virtual_network_link.default]
}