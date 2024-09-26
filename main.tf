module "labels" {
  source      = "git::https://github.com/SyncArcs/terraform-google-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

data "google_client_config" "current" {
}

#####==============================================================================
##### Each VPC network is subdivided into subnets, and each subnet is contained
##### within a single region. You can have more than one subnet in a region for
##### a given VPC network.
#####==============================================================================
#tfsec:ignore:google-compute-enable-vpc-flow-logs
resource "google_compute_subnetwork" "subnetwork" {
  count                    = length(var.subnet_names)
  name                     = var.subnet_names[count.index]
  project                  = data.google_client_config.current.project
  network                  = var.network
  region                   = var.gcp_region
  description              = var.description
  purpose                  = var.purpose
  ipv6_access_type         = var.ipv6_access_type
  private_ip_google_access = var.private_ip_google_access
  ip_cidr_range            = var.ip_cidr_range[count.index]
  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
  dynamic "log_config" {
    for_each = var.log_config != null ? [var.log_config] : []
    content {
      aggregation_interval = try(log_config.value, "aggregation_interval", null)
      flow_sampling        = try(log_config.value, "flow_sampling", null)
      metadata             = try(log_config.value, "metadata", null)
      metadata_fields      = try(log_config.value, "metadata_fields", null)
      filter_expr          = try(log_config.value, "filter_expr", null)
    }
  }
  dynamic "timeouts" {
    for_each = try([var.module_timeouts.google_compute_subnetwork], [])
    content {
      create = try(timeouts.value.create, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }
}

#####==============================================================================
##### Represents a Route resource.
#####==============================================================================
resource "google_compute_route" "default" {
  count            = var.enabled && var.route_enabled ? 1 : 0
  name             = format("%s-route", module.labels.id)
  dest_range       = var.dest_range
  network          = var.network
  next_hop_gateway = var.next_hop_gateway
  priority         = var.priority
}

#####==============================================================================
##### Represents a Router resource.
#####==============================================================================
resource "google_compute_router" "default" {
  count   = var.enabled && var.router_enabled ? 1 : 0
  name    = format("%s-router", module.labels.id)
  region  = var.gcp_region
  project = data.google_client_config.current.project
  network = var.network
  bgp {
    asn = var.asn
  }
}

#####==============================================================================
##### Represents an Address resource.
#####==============================================================================

resource "google_compute_address" "default" {
  count      = var.enabled && var.address_enabled ? 1 : 0
  name       = format("%s-address", module.labels.id)
  ip_version = var.ip_version
  project    = data.google_client_config.current.project
  region     = var.gcp_region
}

#####==============================================================================
##### A NAT service created in a router.
#####==============================================================================
resource "google_compute_router_nat" "nat" {
  count                              = var.enabled && var.router_nat_enabled ? 1 : 0
  name                               = format("%s-router-nat", module.labels.id)
  udp_idle_timeout_sec               = var.udp_idle_timeout_sec
  icmp_idle_timeout_sec              = var.icmp_idle_timeout_sec
  router                             = join("", google_compute_router.default[*].name)
  region                             = var.gcp_region
  project                            = data.google_client_config.current.project
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  nat_ips                            = google_compute_address.default[*].self_link
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  log_config {
    enable = true
    filter = var.filter
  }
}
