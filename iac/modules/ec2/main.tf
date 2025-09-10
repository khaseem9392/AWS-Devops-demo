
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "AppServer"
  }
}

output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
