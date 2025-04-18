terraform {
    cloud {
        organization = "DemoOrgPersonal"
        workspaces {
            name = "dev-test-apim-qa"
        }
    }

required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0.6"
    }
    }
}

provider "azurerm" {
  features {} 
}