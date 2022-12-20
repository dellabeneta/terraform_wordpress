resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0149b2da6ceec4bb0"
  instance_type               = "t2.micro"
  count                       = 3
  key_name                    = "key_linux"
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group.id]


  provisioner "remote-exec" {
    inline = ["sleep 20", "sudo apt update",
              "sleep 20", "sudo apt install -y apache2",
              "sleep 05", "sudo chmod 777 /var/www/html/index.html",
              "sleep 05", "ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)",
              "sleep 05", "echo $ID > /var/www/html/index.html"
             ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_ed25519")
      host        = self.public_ip
    }
  }

    tags = {
    "Name" = "web-server-${count.index}"
  }
  
}