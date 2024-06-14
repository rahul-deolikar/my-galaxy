resource "aws_vpc" "vpc-1" {
    cidr_block = "192.168.0.0/16"
        tags = {
            name = "vpc-B34"
        }
}

resource "aws_subnet" "sbnt-pub" {
    vpc_id = aws_vpc.vpc-1.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "igw-1" {
    vpc_id = aws_vpc.vpc-1.id
}

resource "aws_route_table" "rt-1" {
    vpc_id = aws_vpc.vpc-1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw-1.id
    }
}

resource "aws_route_table_association" "rt-as-1" {
    route_table_id = aws_route_table.rt-1.id
    subnet_id = aws_subnet.sbnt-pub.id
}

