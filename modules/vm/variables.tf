variable "name" {
  description = "Short name used in the resource names."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to build in."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "subnet_id" {
  description = "The subnet the VM goes in."
  type        = string
}

variable "size" {
  description = "VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_public_key" {
  description = "SSH public key for the jason user."
  type        = string
}

variable "shutdown_time" {
  description = "Daily auto-shutdown, UK time, as HHMM."
  type        = string
  default     = "2300"
}

variable "tags" {
  description = "Tags for every resource."
  type        = map(string)
}
