output "public_ip" {
  description = "The VM's public IP."
  value       = module.vm.public_ip
}

output "web_url" {
  description = "The nginx home page."
  value       = "http://${module.vm.public_ip}/"
}
