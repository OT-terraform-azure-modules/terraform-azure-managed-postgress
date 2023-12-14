variable "name" {
  default     = "foxpsqlfs"
  description = "Prefix of the resource name."
}

variable "location" {
  default     = "Jio India West"
  description = "Location of the resource."
}

variable "resource_group_name" {
  default     = ""
  description = "Location of the resource."
}

variable "virtual_network_name" {
  default     = ""
  description = "Location of the resource."
}

variable "subnet_address_prefixes" {
  default     = ""
  description = "Location of the resource."
}

variable "virtual_network_id" {
  default     = ""
  description = "Location of the resource."
}

variable "db_username" {
  description = "PSQL DB USername"
  default = "username"
}

variable "db_password" {
  description = "PSQL DB Password"
  default = "P@ssw0rd"
}

variable "security_rule" {
  description = "Security rule configuration"
  default = {
    name                       = "posgress-sec"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

variable "service_endpoints" {
  description = "service endpoint"
  default = ["Microsoft.Storage"]
}


variable "delegation_name" {
  description = "delegation_name"
  default = "affs"
}

variable "service_delegation" {
  description = "service_delegation"
  default = "Microsoft.DBforPostgreSQL/flexibleServers"
}

variable "action" {
  description = "action"
  default = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
}

variable "posgressversion" {
  description = ""
  default = "12"
}

variable "strorage_mb" {
  description = "strorage_mb"
  default = 256000
}

variable "sku_name" {
  description = "sku_name"
  default = "GP_Standard_D4s_v3"
}

variable "backup_retention_days" {
  description = "backup_retention_days"
  default = 7
}

variable "tags" {
  description = "Define resource tags"
}
