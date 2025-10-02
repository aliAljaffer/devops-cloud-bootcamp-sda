locals {
  number_of_vms   = 2
  name            = "ali"
  vm_name         = "VM"
  location        = "Switzerland North"
  subscription_id = "Subscription ID here"
  ports_allowed = {
    "Http" = {
      protocol = "Tcp"
      port     = 80
      priority = 1000
    }
    "SSH" = {
      protocol = "Tcp"
      port     = 22
      priority = 1001
    }
    "API" = {
      protocol = "Tcp"
      port     = 3000
      priority = 1002
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.40.0"
    }
  }
}

provider "azurerm" {
  subscription_id = local.subscription_id
  features {}
}


# ----------------------------
# Resource Group
# ----------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${replace(" ", "-", lower(local.name))}-rg"
  location = local.location
}

# ----------------------------
# Virtual Network + Subnet
# ----------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "${replace(" ", "-", lower(local.name))}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${replace(" ", "-", lower(local.name))}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# ----------------------------
# Public IPs
# ----------------------------
resource "azurerm_public_ip" "pips" {
  count               = local.number_of_vms
  name                = "vm${count.index + 1}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ----------------------------
# Network Interface
# ----------------------------
resource "azurerm_network_interface" "nics" {
  count               = local.number_of_vms
  name                = "vm${count.index + 1}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pips[count.index].id
  }
}

# ----------------------------
# Network Security Group
# ----------------------------
resource "azurerm_network_security_group" "nsg" {
  name                = "${replace(" ", "-", lower(local.name))}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name


  dynamic "security_rule" {
    for_each = local.ports_allowed
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  count                     = local.number_of_vms
  network_interface_id      = azurerm_network_interface.nics[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# ----------------------------
# Linux VMs
# ----------------------------
resource "azurerm_linux_virtual_machine" "vms" {
  count               = local.number_of_vms
  name                = "${local.vm_name}${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = local.name

  network_interface_ids = [
    azurerm_network_interface.nics[count.index].id
  ]

  admin_ssh_key {
    username   = local.name
    public_key = file("~/.ssh/id_rsa.pub")
  }

  # Only VM1 installs Ansible
  custom_data = count.index == 0 ? base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install -y software-properties-common
              apt-add-repository --yes --update ppa:ansible/ansible
              apt install -y ansible
              EOF
  ) : null

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "vm${count.index + 1}-osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# ----------------------------
# Outputs
# ----------------------------
output "public_ips" {
  value = {
    for i in range(local.number_of_vms) :
    azurerm_linux_virtual_machine.vms[i].name => azurerm_public_ip.pips[i].ip_address
  }
}
