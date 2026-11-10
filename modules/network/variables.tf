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

variable "address_space" {
  description = "The VNet's address range."
  type        = string
}

variable "my_ip" {
  description = "The only IP allowed in."
  type        = string
}

variable "tags" {
  description = "Tags for every resource."
  type        = map(string)
}
