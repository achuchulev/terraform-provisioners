resource "aws_key_pair" "my_key" {
  key_name   = "key-${var.identity}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "atanasc-w1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  key_name               = "${aws_key_pair.my_key.id}"

  tags {
    Name = "${var.tag_name}"
  }

  connection {
    user        = "${var.username}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "provision"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/provision/redis.sh",
      "sudo sh /tmp/provision/redis.sh",       # install redis
      "which redis-server",                    # verify installation
      "redis-cli ping"                         # verify redis is working
    ] 
  }
}
