resource "aws_launch_configuration" "example" {
  image_id = "ami-58d7e821"
  instance_type = "t1.micro"
  security_groups = ["${aws_security_group.instance.id}"]
  key_name = "jwhaws"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get -y install nginx
              echo "Hello, World" > /var/www/html/index.html
              EOF

  lifecycle {
    create_before_destroy = true
  }

}
