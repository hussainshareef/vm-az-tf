output "windows_id" {
  description = "Virtual Machine ID"
  value       = azurerm_windows_virtual_machine.windows.id
}

output "linux_id" {
  description = "Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.linux.id
}

output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.vm.ip_address
}
