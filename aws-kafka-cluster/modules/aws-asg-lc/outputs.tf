output "launch-config-id" {
	value = "${aws_launch_configuration.launch_config.id}"
}

output "asg-id" {
	value = "${aws_autoscaling_group.main_asg.id}"
}

output "asg-name" {
	value = "${aws_autoscaling_group.main_asg.name}"
}
