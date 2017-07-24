variable "security-group-name" {
	description = "The name of security group",
	default = "kafka-group"
}

variable "vpc_id" {
	description = "The vpc where this group will go to"
}

variable "cidr_blocks" {
	description = "The subnets that have traffic allowed",
	type = "list",
	default = ["0.0.0.0/0"]
}
