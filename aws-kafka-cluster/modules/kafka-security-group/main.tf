resource "aws_security_group" "kafka-security-group" {
	name = "${var.security-group-name}"
	description = "tf-${var.security-group-name}"
	vpc_id = "${var.vpc_id}"
}

## Ingress rules
resource "aws_security_group_rule" "ingress_9092_tcp" {
	security_group_id = "${aws_security_group.kafka-security-group.id}"
	from_port = 9092
	to_port = 9092
	protocol = "tcp"
	cidr_blocks = "${var.cidr_blocks}"
	type = "ingress"
}

## Egress rules
resource "aws_security_group_rule" "egress_2181_tcp" {
	security_group_id = "${aws_security_group.kafka-security-group.id}"
	from_port = 2181
	to_port = 2181
	protocol = "tcp"
	cidr_blocks = "${var.cidr_blocks}"
	type = "egress"
}
