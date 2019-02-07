resource "aws_key_pair" "terra_key" {
  key_name   = "mykey"
  public_key = "${var.pub_key}"
}
