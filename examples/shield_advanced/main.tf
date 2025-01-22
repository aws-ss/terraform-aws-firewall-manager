provider "aws" {
  region  = "ap-northeast-2"
}

module "fms" {
  source  = "aws-ss/firewall-manager/aws"
  version = "1.0.3"

  name               = "fms"
  type               = "SHIELD_ADVANCED"
  resource_type_list = ["AWS::ElasticLoadBalancingV2::LoadBalancer"]
  include_map = {
    "account" : ["111111111111"]
  }
  managed_service_data = {
    optimizeUnassociatedWebACL    = false
    automaticResponseStatus       = "ENABLED"
    automaticResponseAction       = "COUNT"
    overrideCustomerWebaclClassic = false
  }
}