variable "prefix" {
  description = "Short name used in every resource name."
  type        = string
}

variable "resource_group_name" {
  description = "The existing resource group to build in."
  type        = string
}

variable "my_ip" {
  description = "Your public IP. Only this address can reach the VM."
  type        = string
}

variable "ssh_public_key" {
  description = "Contents of ~/.ssh/id_ed25519.pub."
  type        = string
}

variable "vm_size" {
  description = "VM size."
  type        = string
  default     = "Standard_B1s"
}
