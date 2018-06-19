provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-58d7e821"
  instance_type = "t1.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags {
    Name = "terraform-example"
  }

  lifecycle {
    create_before_destroy = true
  }

}
