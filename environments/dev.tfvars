resource_group_name = "rg-devops-demo"
location            = "East US"

vm_config = {
  name               = "devops-vm01"
  size               = "Standard_DS1_v2"
  admin_username     = "azureadmin"
  admin_password     = "P@ssw0rd1234!"    # Use env vars or secret manager in real projects
  ssh_public_key     = null               # null if not using SSH
  image_publisher    = "Canonical"
  image_offer        = "UbuntuServer"
  image_sku          = "18.04-LTS"
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
    environment = "dev"
    project     = "terraform-vm"
  }
}
