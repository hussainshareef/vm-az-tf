resource_group_name = "rg-devops-demo"
location            = "East US"

vm_config = {
  name               = "devops-vm02"
  size               = "Standard_DS1_v2"
  admin_username     = "azureadmin"
  admin_password     = "P@ssw0rd1234!"      # In production, use env vars or Key Vault
  ssh_public_key     = null                # No SSH for Windows
  os_type            = "windows"
  image_publisher    = "MicrosoftWindowsServer"
  image_offer        = "WindowsServer"
  image_sku          = "2019-Datacenter"
  image_version      = "latest"

  subnet_id          = "/subscriptions/xxxx/resourceGroups/rg-devops-demo/providers/Microsoft.Network/virtualNetworks/vnet-demo/subnets/subnet-1"

  data_disks = [
    {
      name         = "datadisk1"
      disk_size_gb = 50
      lun          = 0
    },
    {
      name         = "datadisk2"
      disk_size_gb = 100
      lun          = 1
    }
  ]

  tags = {
    environment = "staging"
    project     = "terraform-vm"
  }
}
