variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-devops-demo"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "vm_config" {
  description = "Configuration for the virtual machine"
  type = object({
    name               = string
    size               = string
    admin_username     = string
    admin_password     = optional(string)
    ssh_public_key     = optional(string)
    os_type            = string
    image_publisher    = string
    image_offer        = string
    image_sku          = string
    image_version      = string
    subnet_id          = string
    data_disks         = optional(list(object({
      name         = string
      disk_size_gb = number
      lun          = number
    })), [])
    tags              = optional(map(string), {})
  })
  default = {
    name               = "devops-vm01"
    size               = "Standard_DS1_v2"
    admin_username     = "azureadmin"
    admin_password     = "P@ssw0rd1234!" # Only for Windows
    ssh_public_key     = null
    os_type            = "windows"
    image_publisher    = "MicrosoftWindowsServer"
    image_offer        = "WindowsServer"
    image_sku          = "2019-Datacenter"
    image_version      = "latest"
    subnet_id          = "/subscriptions/<sub-id>/resourceGroups/rg-demo/providers/Microsoft.Network/virtualNetworks/vnet-demo/subnets/default"
    data_disks         = []
    tags = {
      owner      = "admin"
      env        = "test"
    }
  }
}
