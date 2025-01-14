## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```


Here are two easy ways to get the policy information.

* Create an Firewall Manager policy in AWS Console. You can download the JSON format file.

* You can get policy information through AWS CLI commands.

```shell
$ aws fms list-policies

$ aws fms get-policy --policy-id {PolicyId}

{
    "Policy": {
        "PolicyId": "",
        "PolicyName": "fms02",
        "PolicyUpdateToken": "",
        "SecurityServicePolicyData": {
            "Type": "WAFV2",
            "ManagedServiceData": "{\"type\":\"WAFV2\",\"preProcessRuleGroups\":[{\"ruleGroupArn\":null,\"overrideAction\":{\"type\":\"NONE\"},\"managedRuleGroupIdentifier\":{\"versionEnabled\":true,\"version\":null,\"vendorName\":\"AWS\",\"managedRuleGroupName\":\"AWSManagedRulesATPRuleSet\",\"managedRuleGroupConfigs\":[{\"awsmanagedRulesATPRuleSet\":{\"loginPath\":\"/web/login\",\"requestInspection\":{\"payloadType\":\"JSON\",\"usernameField\":{\"identifier\":\"/form/username\"},\"passwordField\":{\"identifier\":\"/form/password\"}}}}]},\"ruleGroupType\":\"ManagedRuleGroup\",\"excludeRules\":[],\"sampledRequestsEnabled\":true,\"ruleActionOverrides\":[{\"name\":\"AttributeCompromisedCredentials\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"AttributeLongSession\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"AttributePasswordTraversal\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"AttributeUsernameTraversal\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"SignalMissingCredential\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"TokenRejected\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"UnsupportedCognitoIDP\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"VolumetricIpHigh\",\"actionToUse\":{\"challenge\":{}}},{\"name\":\"VolumetricSession\",\"actionToUse\":{\"challenge\":{}}}]}],\"postProcessRuleGroups\":[],\"defaultAction\":{\"type\":\"BLOCK\"},\"customRequestHandling\":null,\"customResponse\":{\"enableCustomResponse\":true,\"customResponseBodyKey\":\"fms\",\"responseCode\":403,\"responseHeaders\":[{\"headerName\":\"x-custom-response\",\"headerValue\":\"fms\"}],\"customResponseBodies\":{\"fms\":{\"responseBodyType\":\"APPLICATION_JSON\",\"responseBody\":\"{\\\"error\\\": \\\"accessDenied\\\"}\"}}},\"overrideCustomerWebACLAssociation\":false,\"loggingConfiguration\":null,\"sampledRequestsEnabledForDefaultActions\":true,\"captchaConfig\":{\"immunityTimeProperty\":{\"immunityTime\":500}},\"challengeConfig\":{\"immunityTimeProperty\":{\"immunityTime\":500}},\"tokenDomains\":[\"test.com\"],\"optimizeUnassociatedWebACL\":false,\"webACLSource\":\"DEFAULT\"}"
        },
        "ResourceType": "ResourceTypeList",
        "ResourceTypeList": [
            "AWS::ElasticLoadBalancingV2::LoadBalancer",
            "AWS::ApiGateway::Stage"
        ],
        "ResourceTags": [],
        "ExcludeResourceTags": false,
        "RemediationEnabled": false,
        "DeleteUnusedFMManagedResources": false,
        "IncludeMap": {
            "ACCOUNT": [
                "111111111111"
            ],
            "ORG_UNIT": []
        },
        "ResourceSetIds": [],
        "PolicyStatus": "ACTIVE"
    },
    "PolicyArn": ""
}
```