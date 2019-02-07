resource "aws_db_instance" "terraRDS" {
  allocated_storage      = "20"
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  name                   = "${var.db_name}"                     #database_name
  username               = "${var.db_user}"
  password               = "${var.db_pwd}"
  parameter_group_name   = "default.mysql5.7"
  instance_class         = "db.t2.micro"
  db_subnet_group_name   = "terradbsub"
  skip_final_snapshot    = "true"
  vpc_security_group_ids = ["${aws_security_group.prv_sql.id}"]

  tags {
    Name = "My Terra DB"
  }
}

resource "aws_db_subnet_group" "terraDBSub" {
  name       = "terradbsub"
  subnet_ids = ["${aws_subnet.terraPrv1.id}", "${aws_subnet.terraPrv2.id}"]

  tags {
    Name = "My DB subnet group"
  }
}
