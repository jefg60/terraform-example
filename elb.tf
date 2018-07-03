resource "aws_elb" "example" {
  name = "terraform-asg-example"
  #security_groups = ["${aws_security_group.elb.id}"]
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 2
    interval = 6
    target = "HTTP:${var.server_port}/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "${var.server_port}"
    instance_protocol = "http"
  }
}
