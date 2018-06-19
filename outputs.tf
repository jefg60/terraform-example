output "public_ip" {
  value = "${aws_launch_configuration.example.public_ip}"
}
