resource "aws_key_pair" "key" {
  key_name   = "key_linux"
  public_key = file("~/.ssh/id_ed25519.pub")
}