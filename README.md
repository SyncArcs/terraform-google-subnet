# Terraform-google-subnet
# Terraform Google Cloud subnet Module

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)


## Introduction

This project deploys a Google Cloud infrastructure using Terraform to create Subnet .


## Usage

To get started, make sure you have configured your GCP provider. You can use the following code as a starting point:
## Example: subnet
```hcl
module "subnet" {
  source        = "git::https://github.com/SyncArcs/terraform-google-subnet.git?ref=v1.0.0"
  name          = "app"
  environment   = "test"
  subnet_names  = ["subnet-a", "subnet-b"]
  gcp_region    = "asia-northeast1"
  network       = module.vpc.vpc_id
  ip_cidr_range = ["10.10.1.0/24", "10.10.5.0/24"]
}
```
Make sure to configure the variables according to your requirements.


## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/SyncArcs/terraform-google-subnet/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **SyncArcs** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/SyncArcs/terraform-google-subnet/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/SyncArcs/terraform-google-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_route.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_router.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_enabled"></a> [address\_enabled](#input\_address\_enabled) | Toggle to enable or disable address functionality. | `bool` | `true` | no |
| <a name="input_asn"></a> [asn](#input\_asn) | Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. | `number` | `64514` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) An optional description of the VPC. The resource must be recreated to modify this field.Default is ''. | `string` | `""` | no |
| <a name="input_dest_range"></a> [dest\_range](#input\_dest\_range) | The destination range of outgoing packets that this route applies to. Only IPv4 is supported. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Toggle to enable or disable the main functionality. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_filter"></a> [filter](#input\_filter) | Specifies the desired filtering of logs on this NAT. | `string` | `"ERRORS_ONLY"` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Google Cloud region | `string` | `"europe-west3"` | no |
| <a name="input_icmp_idle_timeout_sec"></a> [icmp\_idle\_timeout\_sec](#input\_icmp\_idle\_timeout\_sec) | (Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. | `number` | `30` | no |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | (Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | (Optional) The IP Version that will be used by this address. The default value is IPV4. Possible values are: IPV4, IPV6. | `string` | `"IPV4"` | no |
| <a name="input_ipv6_access_type"></a> [ipv6\_access\_type](#input\_ipv6\_access\_type) | The access type of IPv6 address this subnet holds. | `string` | `"EXTERNAL"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_log_config"></a> [log\_config](#input\_log\_config) | (Optional) Logging options for the subnetwork flow logs. Setting this value to 'null' will disable them. See https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html for more information and examples. | `any` | `null` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'SyncArcs'. | `string` | `"SyncArcs"` | no |
| <a name="input_module_timeouts"></a> [module\_timeouts](#input\_module\_timeouts) | (Optional) How long certain operations (per resource type) are allowed to take before being considered to have failed. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource, provided by the client when initially creating the resource. | `string` | `""` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | How external IPs should be allocated for this NAT. | `string` | `"MANUAL_ONLY"` | no |
| <a name="input_network"></a> [network](#input\_network) | (Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks. | `string` | `""` | no |
| <a name="input_next_hop_gateway"></a> [next\_hop\_gateway](#input\_next\_hop\_gateway) | URL to a gateway that should handle matching packets. | `string` | `"default-internet-gateway"` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority of this route. | `number` | `1000` | no |
| <a name="input_private_ip_google_access"></a> [private\_ip\_google\_access](#input\_private\_ip\_google\_access) | (Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access. | `bool` | `true` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | - (Optional) The purpose of the resource. This field can be either PRIVATE\_RFC\_1918, REGIONAL\_MANAGED\_PROXY, GLOBAL\_MANAGED\_PROXY, or PRIVATE\_SERVICE\_CONNECT | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/SyncArcs/terraform-google-subnet"` | no |
| <a name="input_route_enabled"></a> [route\_enabled](#input\_route\_enabled) | Toggle to enable or disable routing functionality. | `bool` | `true` | no |
| <a name="input_router_enabled"></a> [router\_enabled](#input\_router\_enabled) | Toggle to enable or disable the router. | `bool` | `true` | no |
| <a name="input_router_nat_enabled"></a> [router\_nat\_enabled](#input\_router\_nat\_enabled) | Toggle to enable or disable NAT functionality for the router. | `bool` | `true` | no |
| <a name="input_secondary_ip_ranges"></a> [secondary\_ip\_ranges](#input\_secondary\_ip\_ranges) | An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges. | `any` | `[]` | no |
| <a name="input_source_subnetwork_ip_ranges_to_nat"></a> [source\_subnetwork\_ip\_ranges\_to\_nat](#input\_source\_subnetwork\_ip\_ranges\_to\_nat) | How NAT should be configured per Subnetwork. | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The name of the resource, provided by the client when initially creating the resource. | `list(string)` | `[]` | no |
| <a name="input_udp_idle_timeout_sec"></a> [udp\_idle\_timeout\_sec](#input\_udp\_idle\_timeout\_sec) | (Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_name"></a> [address\_name](#output\_address\_name) | The name of the GCP address. |
| <a name="output_address_project"></a> [address\_project](#output\_address\_project) | The project of the GCP address. |
| <a name="output_address_region"></a> [address\_region](#output\_address\_region) | The region of the GCP address. |
| <a name="output_route_id"></a> [route\_id](#output\_route\_id) | The ID of the GCP route. |
| <a name="output_route_next_hop_network"></a> [route\_next\_hop\_network](#output\_route\_next\_hop\_network) | The next hop network of the GCP route. |
| <a name="output_route_self_link"></a> [route\_self\_link](#output\_route\_self\_link) | The self-link of the GCP route. |
| <a name="output_router_creation_timestamp"></a> [router\_creation\_timestamp](#output\_router\_creation\_timestamp) | The timestamp when the GCP router was created. |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | The ID of the GCP router. |
| <a name="output_router_nat_name"></a> [router\_nat\_name](#output\_router\_nat\_name) | The name of the GCP router NAT configuration. |
| <a name="output_router_nat_router"></a> [router\_nat\_router](#output\_router\_nat\_router) | The router associated with the GCP router NAT configuration. |
| <a name="output_router_net_project"></a> [router\_net\_project](#output\_router\_net\_project) | The project of the GCP router NAT configuration. |
| <a name="output_router_net_region"></a> [router\_net\_region](#output\_router\_net\_region) | The region of the GCP router NAT configuration. |
| <a name="output_router_self_link"></a> [router\_self\_link](#output\_router\_self\_link) | The self-link of the GCP router. |
| <a name="output_subnet_creation_timestamp"></a> [subnet\_creation\_timestamp](#output\_subnet\_creation\_timestamp) | The timestamp when the GCP subnetwork was created. |
| <a name="output_subnet_external_ipv6_prefix"></a> [subnet\_external\_ipv6\_prefix](#output\_subnet\_external\_ipv6\_prefix) | The external IPv6 prefix of the GCP subnetwork. |
| <a name="output_subnet_gateway_address"></a> [subnet\_gateway\_address](#output\_subnet\_gateway\_address) | The gateway address of the GCP subnetwork. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the GCP subnetwork. |
| <a name="output_subnet_ipv6_cidr_range"></a> [subnet\_ipv6\_cidr\_range](#output\_subnet\_ipv6\_cidr\_range) | The IPv6 CIDR range of the GCP subnetwork. |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the GCP subnetwork. |
| <a name="output_subnet_self_link"></a> [subnet\_self\_link](#output\_subnet\_self\_link) | The self-link of the GCP subnetwork. |
<!-- END_TF_DOCS -->