resource "aws_instance" "vm-1" {
    ami = "ami-04b70fa74e45c3917"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = "B-34"
     tags = {
        name = "server-1"
     }
}