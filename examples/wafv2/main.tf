module "fms01" {
  source = "../..//"

  name               = "fms01"
  type               = "WAFV2"
  resource_type_list = ["AWS::ElasticLoadBalancingV2::LoadBalancer"]
  include_map = {
    "account" : ["111111111111", "222222222222"]
  }
  managed_service_data = {
    "preProcessRuleGroups" : [
      {
        "ruleGroupType" : "RuleGroup",
        "overrideAction" : {
          "type" : "NONE"
        },
        "sampledRequestsEnabled" : true,
        "excludeRules" : [],
        "ruleGroupArn" : "",
        "ruleGroupName" : "BLOCK_IP_ADDRESS"
      }
    ]
    "defaultAction" : { "type" : "ALLOW" },
    "type" : "WAFV2",
    "overrideCustomerWebACLAssociation" : false,
    "sampledRequestsEnabledForDefaultActions" : true,
    "optimizeUnassociatedWebACL" : false,
    # 'DEFAULT' or 'RETROFIT_EXISTING'
    "webACLSource" : "DEFAULT"
  }
}

#module "fms02" {
#  source = "../..//"
#
#  name               = "fms02"
#  type               = "WAFV2"
#  resource_type_list = ["AWS::ElasticLoadBalancingV2::LoadBalancer", "AWS::ApiGateway::Stage"]
#  include_map = {
#    "account" : ["111111111111"]
#  }
#  managed_service_data = {
#    "preProcessRuleGroups" : [
#      {
#        "ruleGroupType" : "ManagedRuleGroup",
#        "overrideAction" : { "type" : "NONE" },
#        "sampledRequestsEnabled" : true,
#        "ruleActionOverrides" : [
#          {
#            "name" : "AttributeCompromisedCredentials",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "AttributeLongSession",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "AttributePasswordTraversal",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "AttributeUsernameTraversal",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "SignalMissingCredential",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "TokenRejected",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "UnsupportedCognitoIDP",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "VolumetricIpHigh",
#            "actionToUse" : { "challenge" : {} }
#          },
#          {
#            "name" : "VolumetricSession",
#            "actionToUse" : { "challenge" : {} }
#          }
#        ],
#        "managedRuleGroupIdentifier" : {
#          "managedRuleGroupName" : "AWSManagedRulesATPRuleSet",
#          "vendorName" : "AWS",
#          "versionEnabled" : true,
#          "version" : null,
#          "managedRuleGroupConfigs" : [
#            {
#              "awsmanagedRulesATPRuleSet" : {
#                "loginPath" : "/web/login",
#                "requestInspection" : {
#                  "payloadType" : "JSON",
#                  "usernameField" : { "identifier" : "/form/username" },
#                  "passwordField" : { "identifier" : "/form/password" }
#                }
#              }
#            }
#          ]
#        }
#      }
#    ],
#    "postProcessRuleGroups" : [],
#    "defaultAction" : { "type" : "BLOCK" },
#    "customRequestHandling" : null,
#    "associationConfig" : null,
#    "tokenDomains" : ["test.com"],
#    "customResponse" : {
#      "enableCustomResponse" : true,
#      "customResponseBodyKey" : "fms",
#      "responseCode" : 403,
#      "responseHeaders" : [
#        {
#          "headerName" : "x-custom-response",
#          "headerValue" : "fms"
#        }
#      ],
#      "customResponseBodies" : {
#        "fms" : {
#          "responseBodyType" : "APPLICATION_JSON",
#          "responseBody" : "{\\'error\\': \\'accessDenied\\'}"
#        }
#      }
#    },
#    "type" : "WAFV2",
#    "overrideCustomerWebACLAssociation" : false,
#    "sampledRequestsEnabledForDefaultActions" : true,
#    "optimizeUnassociatedWebACL" : false,
#    "webACLSource" : "DEFAULT"
#  }
#}
