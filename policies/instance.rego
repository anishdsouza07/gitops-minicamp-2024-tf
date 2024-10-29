package terraform

import rego.v1

allowed_instances := ["t3.micro","t2.small"]

# New deny message
deny[msg] if {
	some resource in input.resource_changes
	resource.type == "aws_instance"
	instance_type := resource.change.after.instance_type
	not instance_type in allowed_instances
    msg := sprintf("This instance %v is not allowed", [instance_type])
}
