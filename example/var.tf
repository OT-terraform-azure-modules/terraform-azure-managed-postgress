variable "name" {
  default     = ""
  description = "Prefix of the resource name."
}


variable "subnet_address_prefixes" {
  default     = []
  description = "Location of the resource."
}

variable "db_username" {
  description = "PSQL DB USername"
  default     = ""
}

variable "db_password" {
  description = "PSQL DB Password"
  default     = ""
}

variable "name-subnet" {
  description = "subnet name"
  default     = ""
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

variable "posgressversion" {
  description = ""
  default     = 12
}

variable "strorage_mb" {
  description = "strorage_mb"
  default     = 256000
}

variable "sku_name" {
  description = "sku_name"
  default     = "GP_Standard_D4s_v3"
}

variable "backup_retention_days" {
  description = "backup_retention_days"
  default     = 7
}

variable "tags" {
  description = "Define resource tags"
}