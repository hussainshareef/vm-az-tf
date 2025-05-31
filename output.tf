output "vm_id" {
  description = "Virtual Machine ID"
  value       = var.vm_config.os_type == "windows" ? azurerm_windows_virtual_machine.vm[0].id : azurerm_linux_virtual_machine.vm[0].id
}

output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.vm.ip_address
}