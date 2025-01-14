provider "aws" {
  region = "ap-northeast-2"
}

module "fms01" {
  source = "../..//"

  name               = "fms01"
  type               = "WAFV2"
  resource_type_list = ["AWS::ElasticLoadBalancingV2::LoadBalancer"]
  include_map = {
    "account" : ["111111111111", "222222222222"]
  }
  managed_service_data = {
    preProcessRuleGroups = [
      {
        "ruleGroupArn" : null,
        "overrideAction" : {
          "type" : "NONE"
        },
        "managedRuleGroupIdentifier" : {
          "versionEnabled" : null,
          "version" : null,
          "vendorName" : "AWS",
          "managedRuleGroupName" : "AWSManagedRulesKnownBadInputsRuleSet"
        },
        "ruleGroupType" : "ManagedRuleGroup",
        "excludeRules" : [],
        "sampledRequestsEnabled" : true
      }
    ]
    default_action                          = "allow"
    sampledRequestsEnabledForDefaultActions = true
  }
}

module "fms02" {
  source = "../..//"

  name               = "fms02"
  type               = "WAFV2"
  resource_type_list = ["AWS::ElasticLoadBalancingV2::LoadBalancer", "AWS::ApiGateway::Stage"]
  include_map = {
    "account" : ["111111111111"]
  }
  managed_service_data = {
    preProcessRuleGroups = [
      {
        "ruleGroupArn": null,
        "overrideAction": {
          "type": "NONE"
        },
        "managedRuleGroupIdentifier": {
          "versionEnabled": true,
          "version": null,
          "vendorName": "AWS",
          "managedRuleGroupName": "AWSManagedRulesATPRuleSet",
          "managedRuleGroupConfigs": [
            {
              "awsmanagedRulesATPRuleSet": {
                "loginPath": "/web/login",
                "requestInspection": {
                  "payloadType": "JSON",
                  "usernameField": {
                    "identifier": "/form/username"
                  },
                  "passwordField": {
                    "identifier": "/form/password"
                  }
                }
              }
            }
          ]
        },
        "ruleGroupType": "ManagedRuleGroup",
        "excludeRules": [],
        "sampledRequestsEnabled": true,
        "ruleActionOverrides": [
          {
            "name": "AttributeCompromisedCredentials",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "AttributeLongSession",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "AttributePasswordTraversal",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "AttributeUsernameTraversal",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "SignalMissingCredential",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "TokenRejected",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "UnsupportedCognitoIDP",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "VolumetricIpHigh",
            "actionToUse": {
              "challenge": {}
            }
          },
          {
            "name": "VolumetricSession",
            "actionToUse": {
              "challenge": {}
            }
          }
        ]
      }
    ]
    default_action                          = "block"
    customResponse                          = {
        "enableCustomResponse": true,
        "customResponseBodyKey": "fms",
        "responseCode": 403,
        "responseHeaders": [
          {
            "headerName": "x-custom-response",
            "headerValue": "fms"
          }
        ],
        "customResponseBodies": {
          "fms": {
            "responseBodyType": "APPLICATION_JSON",
            "responseBody": "{\"error\": \"accessDenied\"}"
          }
        }
    }
    sampledRequestsEnabledForDefaultActions = true
    captchaConfig                           = 500
    challengeConfig                         = 500
    tokenDomains                            = ["test.com"]
  }
}
