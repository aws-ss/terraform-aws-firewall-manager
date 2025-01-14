variable "name" {
  description = "(Required, Forces new resource) The friendly name of the AWS Firewall Manager Policy."
  type        = string
}

variable "delete_all_policy_resources" {
  description = "(Optional) If true, the request will also perform a clean-up process. Defaults to true."
  type        = bool
  default     = true
}

variable "delete_unused_fm_managed_resources" {
  description = "(Optional) If true, Firewall Manager will automatically remove protections from resources that leave the policy scope. Defaults to false."
  type        = bool
  default     = false
}

variable "description" {
  description = "(Optional) The description of the AWS Network Firewall firewall policy."
  type        = string
  default     = null
}

variable "exclude_map" {
  description = "(Optional) A map of lists of accounts and OU's to exclude from the policy."
  type        = map(list(string))
  default     = {}
}

variable "exclude_resource_tags" {
  description = "(Required, Forces new resource) A boolean value, if true the tags that are specified in the resource_tags are not protected by this policy. If set to false and resource_tags are populated, resources that contain tags will be protected by this policy."
  type        = bool
  default     = false
}

variable "include_map" {
  description = "(Optional) A map of lists of accounts and OU's to include in the policy."
  type        = map(list(string))
  default     = {}
}

variable "remediation_enabled" {
  description = "(Required) A boolean value, indicates if the policy should automatically applied to resources that already exist in the account."
  type        = bool
  default     = false
}

variable "resource_tags" {
  description = "(Optional) A map of resource tags, that if present will filter protections on resources based on the exclude_resource_tags."
  type        = map(string)
  default     = {}
}

variable "type" {
  description = "(Required, Forces new resource) The service that the policy is using to protect the resources."
  type        = string

  validation {
    condition     = contains(["WAF", "WAFV2", "SHIELD_ADVANCED", "SECURITY_GROUPS_COMMON", "SECURITY_GROUPS_CONTENT_AUDIT", "SECURITY_GROUPS_USAGE_AUDIT", "NETWORK_FIREWALL", "DNS_FIREWALL", "THIRD_PARTY_FIREWALL", "IMPORT_NETWORK_FIREWALL", "NETWORK_ACL_COMMON"], var.type)
    error_message = "The 'type' must be one of 'WAF', 'WAFV2', 'SHIELD_ADVANCED', 'SECURITY_GROUPS_COMMON', 'SECURITY_GROUPS_CONTENT_AUDIT', 'SECURITY_GROUPS_USAGE_AUDIT', 'NETWORK_FIREWALL', 'DNS_FIREWALL', 'THIRD_PARTY_FIREWALL', 'IMPORT_NETWORK_FIREWALL', or 'NETWORK_ACL_COMMON'."
  }
}

variable "resource_type_list" {
  description = "(Optional) A list of resource types to protect."
  type        = list(string)
  default     = []
}

variable "managed_service_data" {
  description = "(Optional) A list of resource types to protect. Conflicts with resource_type."
  type        = any
}

variable "tags" {
  description = "(Optional) Key-value mapping of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}
