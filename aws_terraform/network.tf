resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.terraVPC.id}"

  tags {
    Name = "mainIGW"
  }
}

resource "aws_route_table" "terraRT" {
  vpc_id = "${aws_vpc.terraVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_route_table_association" "terraPubAsso" {
  subnet_id      = "${aws_subnet.terraPub1.id}"
  route_table_id = "${aws_route_table.terraRT.id}"
}
