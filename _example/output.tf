output "subnet_id" {
  description = "The ID of the GCP subnet."
  value       = module.subnet.subnet_id
}

output "subnet_name" {
  description = "The name of the GCP subnet."
  value       = module.subnet.subnet_name
}

output "subnet_creation_timestamp" {
  description = "The timestamp when the GCP subnet was created."
  value       = module.subnet.subnet_creation_timestamp
}

output "subnet_gateway_address" {
  description = "The gateway address of the GCP subnet."
  value       = module.subnet.subnet_gateway_address
}

output "subnet_ipv6_cidr_range" {
  description = "The IPv6 CIDR range of the GCP subnet."
  value       = module.subnet.subnet_ipv6_cidr_range
}

output "subnet_external_ipv6_prefix" {
  description = "The external IPv6 prefix of the GCP subnet."
  value       = module.subnet.subnet_external_ipv6_prefix
}

output "subnet_self_link" {
  description = "The self-link of the GCP subnet."
  value       = module.subnet.subnet_self_link
}

output "route_id" {
  description = "The ID of the GCP route associated with the subnet."
  value       = module.subnet.route_id
}

output "route_next_hop_network" {
  description = "The next hop network of the GCP route associated with the subnet."
  value       = module.subnet.route_next_hop_network
}

output "route_self_link" {
  description = "The self-link of the GCP route associated with the subnet."
  value       = module.subnet.route_self_link
}

output "router_id" {
  description = "The ID of the GCP router associated with the subnet."
  value       = module.subnet.router_id
}

output "router_creation_timestamp" {
  description = "The timestamp when the GCP router associated with the subnet was created."
  value       = module.subnet.router_creation_timestamp
}

output "router_self_link" {
  description = "The self-link of the GCP router associated with the subnet."
  value       = module.subnet.router_self_link
}

output "address_name" {
  description = "The name of the GCP address associated with the subnet."
  value       = module.subnet.address_name
}

output "address_project" {
  description = "The project of the GCP address associated with the subnet."
  value       = module.subnet.address_project
}

output "address_region" {
  description = "The region of the GCP address associated with the subnet."
  value       = module.subnet.address_region
}

output "router_nat_name" {
  description = "The name of the GCP router NAT configuration associated with the subnet."
  value       = module.subnet.router_nat_name
}

output "router_nat_router" {
  description = "The router associated with the GCP router NAT configuration."
  value       = module.subnet.router_nat_router
}

output "router_net_project" {
  description = "The project of the GCP router NAT configuration associated with the subnet."
  value       = module.subnet.router_net_project
}

output "router_net_region" {
  description = "The region of the GCP router NAT configuration associated with the subnet."
  value       = module.subnet.router_net_region
}