resource "aws_security_group" "zookeeper-security-group" {
	name = "${var.security-group-name}"
	description = "tf-${var.security-group-name}"
	vpc_id = "${var.vpc_id}"
}

## Ingress rules
resource "aws_security_group_rule" "ingress_2181_tcp" {
	security_group_id = "${aws_security_group.zookeeper-security-group.id}"
	from_port = 2181
	to_port = 2181
	protocol = "tcp"
	cidr_blocks = "${var.cidr_blocks}"
	type = "ingress"
}

resource "aws_security_group_rule" "ingress_2888_tcp" {
	security_group_id = "${aws_security_group.zookeeper-security-group.id}"
	from_port = 2888
	to_port = 2888
	protocol = "tcp"
	cidr_blocks = "${var.cidr_blocks}"
	type = "ingress"
}

resource "aws_security_group_rule" "ingress_3888_tcp" {
	security_group_id = "${aws_security_group.zookeeper-security-group.id}"
	from_port = 3888
	to_port = 3888
	protocol = "tcp"
	cidr_blocks = "${var.cidr_blocks}"
	type = "ingress"
}
