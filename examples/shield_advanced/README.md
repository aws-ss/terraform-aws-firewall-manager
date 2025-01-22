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
        "PolicyName": "fms",
        "PolicyUpdateToken": "",
        "SecurityServicePolicyData": {
            "Type": "SHIELD_ADVANCED",
            "ManagedServiceData": "{\"type\":\"SHIELD_ADVANCED\",\"automaticResponseConfiguration\":{\"automaticResponseStatus\":\"ENALBED\",\"automaticResponseAction\":\"COUNT\"},\"overrideCustomerWebaclClassic\":false,\"optimizeUnassociatedWebACL\":false}"
        },
        "ResourceType": "AWS::ElasticLoadBalancingV2::LoadBalancer",
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
        "PolicyStatus": "ACTIVE"
    },
    "PolicyArn": ""
}
```