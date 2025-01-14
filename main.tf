locals {
  managed_service_data = var.type == "WAFV2" ? {
    type                  = var.type
    preProcessRuleGroups  = lookup(var.managed_service_data, "preProcessRuleGroups", [])
    postProcessRuleGroups = lookup(var.managed_service_data, "postProcessRuleGroups", [])
    defaultAction = {
      type = upper(lookup(var.managed_service_data, "default_action", "allow"))
    }
    customRequestHandling                   = lookup(var.managed_service_data, "customRequestHandling", null)
    customResponse                          = lookup(var.managed_service_data, "customResponse", null)
    overrideCustomerWebACLAssociation       = lookup(var.managed_service_data, "overrideCustomerWebACLAssociation", false)
    loggingConfiguration                    = lookup(var.managed_service_data, "loggingConfiguration", null)
    sampledRequestsEnabledForDefaultActions = lookup(var.managed_service_data, "sampledRequestsEnabledForDefaultActions", false)
    captchaConfig = {
      immunityTimeProperty = {
        immunityTime = lookup(var.managed_service_data, "captchaConfig", 300)
      }
    }
    challengeConfig = {
      immunityTimeProperty = {
        immunityTime = lookup(var.managed_service_data, "challengeConfig", 300)
      }
    }
    tokenDomains               = lookup(var.managed_service_data, "tokenDomains", null)
    optimizeUnassociatedWebACL = lookup(var.managed_service_data, "optimizeUnassociatedWebACL", false)
    webACLSource               = lookup(var.managed_service_data, "webACLSource", "DEFAULT")

    } : var.type == "SHIELD_ADVANCED" ? {
    type                           = var.type
    automaticResponseConfiguration = lookup(var.managed_service_data, "automaticResponseConfiguration", {})
    optimizeUnassociatedWebACL     = lookup(var.managed_service_data, "optimizeUnassociatedWebACL", false)
    overrideCustomerWebaclClassic  = lookup(var.managed_service_data, "overrideCustomerWebaclClassic", false)

    } : var.type == "SECURITY_GROUPS_COMMON" ? {
    type                                      = var.type
    securityGroups                            = lookup(var.managed_service_data, "securityGroups", [])
    securityGroupAction                       = lookup(var.managed_service_data, "securityGroupAction", null)
    revertManualSecurityGroupChanges          = lookup(var.managed_service_data, "revertManualSecurityGroupChanges", false)
    exclusiveResourceSecurityGroupManagement  = lookup(var.managed_service_data, "exclusiveResourceSecurityGroupManagement", false)
    applyToAllEC2InstanceENIs                 = lookup(var.managed_service_data, "applyToAllEC2InstanceENIs", false)
    includeSharedVPC                          = lookup(var.managed_service_data, "includeSharedVPC", false)
    enableSecurityGroupReferencesDistribution = lookup(var.managed_service_data, "enableSecurityGroupReferencesDistribution", false)
    enableTagDistribution                     = lookup(var.managed_service_data, "enableTagDistribution", false)

    } : var.type == "SECURITY_GROUPS_CONTENT_AUDIT" ? {
    type              = var.type
    preManagedOptions = lookup(var.managed_service_data, "preManagedOptions", null)
    securityGroups    = lookup(var.managed_service_data, "securityGroups")
    securityGroupAction = {
      type = lookup(var.managed_service_data, "securityGroupAction")
    }

    } : var.type == "SECURITY_GROUPS_USAGE_AUDIT" ? {
    type                            = var.type
    deleteUnusedSecurityGroups      = lookup(var.managed_service_data, "deleteUnusedSecurityGroups", false)
    coalesceRedundantSecurityGroups = lookup(var.managed_service_data, "coalesceRedundantSecurityGroups", false)
    # 'optionalDelayForUnusedInMinutes' field only applies if deleteUnusedSecurityGroups is set to true.
    optionalDelayForUnusedInMinutes = lookup(var.managed_service_data, "optionalDelayForUnusedInMinutes", 0)

    } : var.type == "NETWORK_FIREWALL" ? {
    type = var.type
    # Centralized deployment model
    awsNetworkFirewallConfig = lookup(var.managed_service_data, "awsNetworkFirewallConfig", null)
    firewallDeploymentModel  = lookup(var.managed_service_data, "firewallDeploymentModel", null)
    # Distributed deployment model
    networkFirewallStatelessRuleGroupReferences    = lookup(var.managed_service_data, "networkFirewallStatelessRuleGroupReferences", null)
    networkFirewallStatelessDefaultActions         = lookup(var.managed_service_data, "networkFirewallStatelessDefaultActions", null)
    networkFirewallStatelessFragmentDefaultActions = lookup(var.managed_service_data, "networkFirewallStatelessFragmentDefaultActions", null)
    networkFirewallStatelessCustomActions          = lookup(var.managed_service_data, "networkFirewallStatelessCustomActions", null)
    networkFirewallStatefulRuleGroupReferences     = lookup(var.managed_service_data, "networkFirewallStatefulRuleGroupReferences", null)
    networkFirewallOrchestrationConfig             = lookup(var.managed_service_data, "networkFirewallOrchestrationConfig", null)
    networkFirewallLoggingConfiguration            = lookup(var.managed_service_data, "networkFirewallLoggingConfiguration", null)

    } : var.type == "DNS_FIREWALL" ? {
    type                  = var.type
    preProcessRuleGroups  = lookup(var.managed_service_data, "preProcessRuleGroups", [])
    postProcessRuleGroups = lookup(var.managed_service_data, "postProcessRuleGroups", [])

  } : {}
}

resource "aws_fms_policy" "this" {
  name                               = var.name
  description                        = var.description
  delete_all_policy_resources        = var.delete_all_policy_resources
  delete_unused_fm_managed_resources = var.delete_unused_fm_managed_resources
  exclude_resource_tags              = var.exclude_resource_tags
  remediation_enabled                = var.remediation_enabled
  resource_tags                      = var.resource_tags
  resource_type_list                 = var.resource_type_list
  tags                               = var.tags

  dynamic "include_map" {
    for_each = var.include_map == {} ? null : [var.include_map]
    content {
      account = lookup(include_map.value, "account", [])
      orgunit = lookup(include_map.value, "orgunit", [])
    }
  }

  dynamic "exclude_map" {
    for_each = var.include_map == {} ? null : [var.exclude_map]
    content {
      account = lookup(exclude_map.value, "account", [])
      orgunit = lookup(exclude_map.value, "orgunit", [])
    }
  }

  security_service_policy_data {
    type                 = var.type
    managed_service_data = jsonencode(local.managed_service_data)
  }
}
