module "kafka-security-group" {
	source = "modules/kafka-security-group"
	
	security-group-name = "kafka"
	vpc_id = ""
	cidr_blocks = ["0.0.0.0/0"]
}

module "zookeeper-security-group" {
	source = "modules/zookeeper-security-group"
	
	security-group-name = "zookeeper"
	vpc_id = ""
	cidr_blocks = ["0.0.0.0/0"]
}

module "kafka-asg" {
	source = "modules/aws-asg-lc"

	launch-config-name = "kafka"
	ami_id = "ami-"
	instance_type = "t2.micro"
	key_name = ""
	security_group = "${module.kafka-security-group.security_group_id}"

	user_data = "user_data.sh"

	autoscaling-group-name = "kafka-asg"
	availability_zones = "eu-central-1,eu-west-1,eu-west-2"

	autoscaling-group-max-instances = "9"
	autoscaling-group-min-instances = "1"
	default-no-of-instances = "3"

	health_check_type = "ELB"
	health_check_period = "300"
}

module "zookeeper-asg" {
	source = "modules/aws-asg-lc"

	launch-config-name = "zk"
	ami_id = "ami-"
	instance_type = "t2.micro"
	key_name = ""
	security_group = "${module.zookeeper-security-group.security_group_id}"

	user_data = "user_data.sh"

	autoscaling-group-name = "zk-asg"
	availability_zones = "eu-central-1,eu-west-1,eu-west-2"

	autoscaling-group-max-instances = "9"
	autoscaling-group-min-instances = "3"
	default-no-of-instances = "5"

	health_check_type = "ELB"
	health_check_period = "300"
}
