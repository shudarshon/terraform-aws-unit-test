module "ec2" {
  source         = "modules/ec2"
  aws_region     = "us-east-1"
  instance_type  = "t2.micro"
  instance_name  = "dev-instance"
  ami_id         = "ami-0ad4957e82982483c"
  subnet_id      = "subnet-5dc34072"
  security_group = "sg-0a5b207e6ef0ee2cb"
  ssh_user_name  = "ec2-user"
  ssh_key_name   = "upskillable"
  ssh_key_path   = "/home/chaks/.key/upskillable.pem"
  instance_count = 1
  dev_host_label = "dev"
}
