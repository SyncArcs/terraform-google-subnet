variable "subnet_names" {
  type        = list(string)
  default     = []
  description = " The name of the resource, provided by the client when initially creating the resource."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "repository" {
  type        = string
  default     = "https://github.com/SyncArcs/terraform-google-subnet"
  description = "Terraform current module repo"
}

variable "managedby" {
  type        = string
  default     = "SyncArcs"
  description = "ManagedBy, eg 'SyncArcs'."
}

variable "name" {
  type        = string
  default     = ""
  description = " The name of the resource, provided by the client when initially creating the resource."
}

variable "network" {
  type        = string
  default     = ""
  description = "(Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks."
}

variable "private_ip_google_access" {
  type        = bool
  default     = true
  description = "(Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "ip_cidr_range" {
  type        = list(string)
  default     = [""]
  description = "(Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
}

variable "secondary_ip_ranges" {
  type        = any
  default     = []
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges."
}

variable "log_config" {
  type        = any
  default     = null
  description = "(Optional) Logging options for the subnetwork flow logs. Setting this value to 'null' will disable them. See https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html for more information and examples."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Toggle to enable or disable the main functionality."
}

variable "route_enabled" {
  type        = bool
  default     = true
  description = "Toggle to enable or disable routing functionality."
}

variable "address_enabled" {
  type        = bool
  default     = true
  description = "Toggle to enable or disable address functionality."
}

variable "router_nat_enabled" {
  type        = bool
  default     = true
  description = "Toggle to enable or disable NAT functionality for the router."
}

variable "router_enabled" {
  type        = bool
  default     = true
  description = "Toggle to enable or disable the router."
}


variable "module_timeouts" {
  type        = any
  default     = {}
  description = "(Optional) How long certain operations (per resource type) are allowed to take before being considered to have failed."
}

variable "gcp_region" {
  type        = string
  default     = "europe-west3"
  description = "Google Cloud region"
}

variable "dest_range" {
  type        = string
  default     = "0.0.0.0/0"
  description = "The destination range of outgoing packets that this route applies to. Only IPv4 is supported."
}

variable "next_hop_gateway" {
  type        = string
  default     = "default-internet-gateway"
  description = "URL to a gateway that should handle matching packets."
}

variable "priority" {
  type        = number
  default     = 1000
  description = "The priority of this route."
}

variable "asn" {
  type        = number
  default     = 64514
  description = "Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit."
}

variable "nat_ip_allocate_option" {
  type        = string
  default     = "MANUAL_ONLY"
  description = "How external IPs should be allocated for this NAT."
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type        = string
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  description = "How NAT should be configured per Subnetwork."
}

variable "filter" {
  type        = string
  default     = "ERRORS_ONLY"
  description = "Specifies the desired filtering of logs on this NAT."
}

variable "description" {
  type        = string
  default     = ""
  description = "(Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''."
}

variable "purpose" {
  type        = string
  default     = ""
  description = "- (Optional) The purpose of the resource. This field can be either PRIVATE_RFC_1918, REGIONAL_MANAGED_PROXY, GLOBAL_MANAGED_PROXY, or PRIVATE_SERVICE_CONNECT"
}

variable "ipv6_access_type" {
  type        = string
  default     = "EXTERNAL"
  description = "The access type of IPv6 address this subnet holds."
}

variable "ip_version" {
  type        = string
  default     = "IPV4"
  description = " (Optional) The IP Version that will be used by this address. The default value is IPV4. Possible values are: IPV4, IPV6."
}

variable "udp_idle_timeout_sec" {
  type        = number
  default     = 30
  description = " (Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set."
}

variable "icmp_idle_timeout_sec" {
  type        = number
  default     = 30
  description = " (Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set."
}
