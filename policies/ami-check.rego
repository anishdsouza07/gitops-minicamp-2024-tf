package terraform

import rego.v1

allowed_ami := ["ami-005fc0f236362e99f"]

deny[msg] if {
	some resource in input.resource_changes
	resource.type == "aws_instance"
	ami_id := resource.change.after.ami
	not ami_id in allowed_ami
	msg := sprintf("This AMI %v is not allowed", [ami_id])
}
