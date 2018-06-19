provider "aws" {
  region = "eu-west-1"
}

resource "aws_launch_configuration" "example" {
  image_id = "ami-58d7e821"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }

}
