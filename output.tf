output "subnet_id" {
  description = "The ID of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].id)
}

output "subnet_name" {
  description = "The name of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].name)
}

output "subnet_creation_timestamp" {
  description = "The timestamp when the GCP subnetwork was created."
  value       = join("", google_compute_subnetwork.subnetwork[*].creation_timestamp)
}

output "subnet_gateway_address" {
  description = "The gateway address of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].gateway_address)
}

output "subnet_ipv6_cidr_range" {
  description = "The IPv6 CIDR range of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].ipv6_cidr_range)
}

output "subnet_external_ipv6_prefix" {
  description = "The external IPv6 prefix of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].external_ipv6_prefix)
}

output "subnet_self_link" {
  description = "The self-link of the GCP subnetwork."
  value       = join("", google_compute_subnetwork.subnetwork[*].self_link)
}

output "route_id" {
  description = "The ID of the GCP route."
  value       = join("", google_compute_route.default[*].id)
}

output "route_next_hop_network" {
  description = "The next hop network of the GCP route."
  value       = join("", google_compute_route.default[*].next_hop_gateway)
}

output "route_self_link" {
  description = "The self-link of the GCP route."
  value       = join("", google_compute_route.default[*].self_link)
}

output "router_id" {
  description = "The ID of the GCP router."
  value       = join("", google_compute_router.default[*].id)
}

output "router_creation_timestamp" {
  description = "The timestamp when the GCP router was created."
  value       = join("", google_compute_router.default[*].creation_timestamp)
}

output "router_self_link" {
  description = "The self-link of the GCP router."
  value       = join("", google_compute_router.default[*].self_link)
}

output "address_name" {
  description = "The name of the GCP address."
  value       = join("", google_compute_address.default[*].name)
}

output "address_project" {
  description = "The project of the GCP address."
  value       = join("", google_compute_address.default[*].project)
}

output "address_region" {
  description = "The region of the GCP address."
  value       = join("", google_compute_address.default[*].region)
}

output "router_nat_name" {
  description = "The name of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].name)
}

output "router_nat_router" {
  description = "The router associated with the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].router)
}

output "router_net_project" {
  description = "The project of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].project)
}

output "router_net_region" {
  description = "The region of the GCP router NAT configuration."
  value       = join("", google_compute_router_nat.nat[*].region)
}