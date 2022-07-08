# Specifiy the provider and version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
    features {}    
}

variable rg_names {
    type = list(string)    
}

variable rg_name {
    type = string
}

variable prefix {
    type = string
    default = "contoso"
}

variable region {           
    type = string
    default = "UK South"
}

variable tags {
    type = map          
}

variable vnets {
    type = list(map(string))    
}
resource "azurerm_virtual_network" "vnet" {
    count               = length(var.vnets)
    name                = lookup(var.vnets[count.index], "name")
    address_space       = [lookup(var.vnets[count.index], "address")]
    location            = var.region
    resource_group_name = azurerm_resource_group.tf_rg.name
}

resource "azurerm_resource_group" "tf_rg" {  
    name = "${var.prefix}_${var.rg_name}"
    location = var.region
    tags = var.tags
}
# outputs.tf
output "rg_id" {    
    value = azurerm_resource_group.tf_rg.id
}
