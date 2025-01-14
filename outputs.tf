output "aws_fms_policy_id" {
  description = "The ID of the AWS Firewall Manager policy."
  value       = aws_fms_policy.this.id
}

output "aws_fms_policy_name" {
  description = "The Name of the AWS Firewall Manager policy."
  value       = aws_fms_policy.this.name
}

output "aws_fms_policy_description" {
  description = "The Description of the AWS Firewall Manager policy."
  value       = aws_fms_policy.this.description
}

output "aws_fms_policy_include_map" {
  description = "The Include Map of the AWS Firewall Manager policy."
  value       = aws_fms_policy.this.include_map
}

output "aws_fms_policy_exclude_map" {
  description = "The Exclude Map of the AWS Firewall Manager policy."
  value       = aws_fms_policy.this.exclude_map
}

output "aws_fms_policy_policy_update_token" {
  description = "A unique identifier for each update to the policy."
  value       = aws_fms_policy.this.policy_update_token
}

output "aws_fms_policy_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_fms_policy.this.tags_all
}

