variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_config" {
  description = "Configuration for the virtual machine"
  type = object({
    name               = string
    size               = string
    admin_username     = string
    admin_password     = string
    ssh_public_key     = optional(string)
    os_type            = string # "windows" or "linux"
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
}
