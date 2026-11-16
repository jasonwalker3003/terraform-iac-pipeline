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

variable "environment" {
  description = "dev or prod."
  type        = string
  default     = "prod"
}

variable "address_space" {
  description = "The VNet's address range. Each environment needs its own."
  type        = string
  default     = "10.50.0.0/16"
}

variable "create_vm" {
  description = "Whether this environment gets a VM."
  type        = bool
  default     = true
}
