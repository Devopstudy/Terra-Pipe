

resource "azurerm_resource_group" "rg-sky" {
  name     = "rg-sky"
  location = "central india"
}

resource "azurerm_storage_account" "aliendisk" {
    depends_on = [azurerm_resource_group.rg-sky]
  name                     = "alienddisk"
  resource_group_name      = "rg-sky"
  location                 = "central india"
  account_tier = "Standard"
  account_replication_type = "LRS"
  min_tls_version         = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
    depends_on = [azurerm_storage_account.aliendisk]
	name = "tfstate"
	storage_account_name = "alienddisk"
	container_access_type  ="private"
	}

resource "azurerm_virtual_network" "alien-network" {
    depends_on          = [azurerm_resource_group.rg-sky]
    name                = "alien-network"
  resource_group_name = "rg-sky"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "alien-subnet" {
    depends_on           = [azurerm_virtual_network.alien-network]
    name                 = "alien-subnet"
    resource_group_name  = "rg-sky"
    virtual_network_name = "alien-network"
    address_prefixes     = ["10.0.1.0/24"]
}