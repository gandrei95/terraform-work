resource "aws_launch_configuration" "launch_config" {
	name = "${var.launch-config-name}"
	image_id = "${var.ami_id}"
	instance_type = "${var.instance_type}"
	key_name = "${var.key_name}"
	security_groups = ["${var.security_group}"]
	
	## user_data provisioner
	user_data = "${file(var.user_data)}"
}

resource "aws_autoscaling_group" "main_asg" {
	depends_on = ["aws_launch_configuration.launch_config"]

	name = "${var.autoscaling-group-name}"

	availability_zones = ["${split(",", var.availability_zones)}"]
	
	launch_configuration = "${aws_launch_configuration.launch_config.id}"

	max_size = "${var.autoscaling-group-max-instances}"
	min_size = "${var.autoscaling-group-min-instances}"
	desired_capacity = "${var.default-no-of-instances}"

	health_check_type = "${var.health_check_type}"
	health_check_grace_period = "${var.health_check_period}"
}
