data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "asso_sg" {
  description = "Attach it to ec2"

  ingress {
    from_port   = 80 
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["143.65.201.2/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


output "asso_sg_id" {
  value = "${aws_security_group.asso_sg.id}"
}