resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    cidr_blocks = ["82.15.223.149/32"]
  }

  lifecycle {
    create_before_destroy = true
  }

}
