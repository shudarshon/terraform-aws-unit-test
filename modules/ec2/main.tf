provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "DevInstanceAWS" {
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  ami           = "${var.ami_id}"
  key_name      = "${var.ssh_key_name}"

  tags {
    Name = "${var.instance_name}"
  }

  security_groups = [
    "${var.security_group}",
  ]
}
