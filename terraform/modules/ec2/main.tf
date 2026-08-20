resource "aws_instance" "this" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_ids[count.index]

  vpc_security_group_ids = [
    var.security_group_id
  ]

  iam_instance_profile = var.instance_profile_name

  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash

    snap install amazon-ssm-agent --classic || true
    systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
    systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
  EOF

  tags = {
    Name    = "${var.project_name}-ec2-${count.index + 1}"
    Project = var.project_name
    Tier    = "backend"
  }
}