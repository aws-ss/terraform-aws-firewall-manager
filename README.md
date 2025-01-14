# terraform-aws-firewall-manager
A Terraform module that creates AWS Firewall Manager.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.82.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.82.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_fms_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fms_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_all_policy_resources"></a> [delete\_all\_policy\_resources](#input\_delete\_all\_policy\_resources) | (Optional) If true, the request will also perform a clean-up process. Defaults to true. | `bool` | `true` | no |
| <a name="input_delete_unused_fm_managed_resources"></a> [delete\_unused\_fm\_managed\_resources](#input\_delete\_unused\_fm\_managed\_resources) | (Optional) If true, Firewall Manager will automatically remove protections from resources that leave the policy scope. Defaults to false. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) The description of the AWS Network Firewall firewall policy. | `string` | `null` | no |
| <a name="input_exclude_map"></a> [exclude\_map](#input\_exclude\_map) | (Optional) A map of lists of accounts and OU's to exclude from the policy. | `map(list(string))` | `{}` | no |
| <a name="input_exclude_resource_tags"></a> [exclude\_resource\_tags](#input\_exclude\_resource\_tags) | (Required, Forces new resource) A boolean value, if true the tags that are specified in the resource\_tags are not protected by this policy. If set to false and resource\_tags are populated, resources that contain tags will be protected by this policy. | `bool` | `false` | no |
| <a name="input_include_map"></a> [include\_map](#input\_include\_map) | (Optional) A map of lists of accounts and OU's to include in the policy. | `map(list(string))` | `{}` | no |
| <a name="input_managed_service_data"></a> [managed\_service\_data](#input\_managed\_service\_data) | (Optional) A list of resource types to protect. Conflicts with resource\_type. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required, Forces new resource) The friendly name of the AWS Firewall Manager Policy. | `string` | n/a | yes |
| <a name="input_remediation_enabled"></a> [remediation\_enabled](#input\_remediation\_enabled) | (Required) A boolean value, indicates if the policy should automatically applied to resources that already exist in the account. | `bool` | `false` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | (Optional) A map of resource tags, that if present will filter protections on resources based on the exclude\_resource\_tags. | `map(string)` | `{}` | no |
| <a name="input_resource_type_list"></a> [resource\_type\_list](#input\_resource\_type\_list) | (Optional) A list of resource types to protect. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value mapping of resource tags. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required, Forces new resource) The service that the policy is using to protect the resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_fms_policy_description"></a> [aws\_fms\_policy\_description](#output\_aws\_fms\_policy\_description) | The Description of the AWS Firewall Manager policy. |
| <a name="output_aws_fms_policy_exclude_map"></a> [aws\_fms\_policy\_exclude\_map](#output\_aws\_fms\_policy\_exclude\_map) | The Exclude Map of the AWS Firewall Manager policy. |
| <a name="output_aws_fms_policy_id"></a> [aws\_fms\_policy\_id](#output\_aws\_fms\_policy\_id) | The ID of the AWS Firewall Manager policy. |
| <a name="output_aws_fms_policy_include_map"></a> [aws\_fms\_policy\_include\_map](#output\_aws\_fms\_policy\_include\_map) | The Include Map of the AWS Firewall Manager policy. |
| <a name="output_aws_fms_policy_name"></a> [aws\_fms\_policy\_name](#output\_aws\_fms\_policy\_name) | The Name of the AWS Firewall Manager policy. |
| <a name="output_aws_fms_policy_policy_update_token"></a> [aws\_fms\_policy\_policy\_update\_token](#output\_aws\_fms\_policy\_policy\_update\_token) | A unique identifier for each update to the policy. |
| <a name="output_aws_fms_policy_tags_all"></a> [aws\_fms\_policy\_tags\_all](#output\_aws\_fms\_policy\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->