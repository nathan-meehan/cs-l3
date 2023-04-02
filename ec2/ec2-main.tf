resource "aws_instance" "tf_vm_pub" {
  ami                         = "ami-00c39f71452c08778"
  instance_type               = "t2.micro"
  subnet_id                   = var.sn_pub_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name = "nathan-m-kp"
  user_data                   = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "<html><body><h1> Hello from Nathan Meehan at $(hostname -f) </html></body></h1>" > index.html
systemctl restart httpd
systemctl enable httpd
EOF
}

resource "aws_instance" "tf_vm_priv" {
  ami                    = "ami-00c39f71452c08778"
  instance_type          = "t2.micro"
  subnet_id              = var.sn_priv_id
  vpc_security_group_ids = [var.sg_id]
  key_name = "nathan-m-kp"
  user_data              = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo "<html><body><h1> Hello from Nathan Meehan at $(hostname -f) </html></body></h1>" > index.html
systemctl restart httpd
systemctl enable httpd
EOF
}