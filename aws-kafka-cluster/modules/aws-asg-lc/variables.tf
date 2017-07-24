## Launch-config variables

variable "launch-config-name" {
	default = ""
}
variable "ami_id" {
	description = "The AMI id used for launch-config"
}
variable "instance_type" {
	description = "The flavor for resources",
	default = "t2.micro"
}
variable "key_name" {
	description = "SSH Key name",
	default = ""
}
variable "security_group" {
	description = "ID of security group where instances belong to",
	default = ""
}
variable "user_data" {
	description = "Path to user_data.sh file, used for provisioning",
	default = ""
}

## ASG variables

variable "autoscaling-group-name" {
	description = "Name of ASG"
}
variable "availability_zones" {
	description = "Comma separated values of AZs"
}
variable "autoscaling-group-max-instances" {
	description = "Max. no. of instances in ASG",
	default = "9"
}
variable "autoscaling-group-min-instances" {
	description = "Min. no. of instances in ASG",
	default = "1"
}
variable "default-no-of-instances" {
	description = "Desired no. of instances in ASG",
	default = "3"
}
variable "health_check_type" {
	description = "Method of checking the health of instances in ASG",
	default = "ELB"
}
variable "health_check_period" {
	description = "Time after an instance comes to service before being health-checked",
	default = "300"
}
