# Create a key pair to access the EC2 instance
resource "aws_key_pair" "ec2_key_pair" {
    key_name = "terra-ec2-key"
    public_key = file("keys.pub")
}

# Create a default VPC 
resource "aws_default_vpc" "default" {
    
}

# Create a Security Group to allow SSH and HTTP access
resource "aws_security_group" "allow_ssh_http" {
    name = "allow_ssh_http"
    description = "Define inbound and outbound rules for security group"
    vpc_id = aws_default_vpc.default.id         # interpolation 

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        description = "allow ssh access"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        description = "allow http access"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 8000
        to_port = 8000
        protocol ="tcp"
        description = "inbound rule for an application"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"   # -1 means all protocols
        cidr_blocks =["0.0.0.0/0"]
    }

    tags ={
        name = "allow-ssh-http"
    }
}

# Create an EC2 instance
resource "aws_instance" "my_ec2_instance" {
    ami = var.ami_id 
    instance_type = var.instance_type
    key_name = aws_key_pair.ec2_key_pair.key_name
    security_groups = [aws_security_group.allow_ssh_http.name]

    root_block_device{
        volume_size = 10
        volume_type = "gp3"
        delete_on_termination = true
    }
   
    user_data = file("script.sh") # path to script file to install nginx automatically when instance is created


    tags = {
        Name = "Terra-server"
    }
}