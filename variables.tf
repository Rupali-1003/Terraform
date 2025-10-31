# creating variable block for deafult ec2 instance type and ami

variable "instance_type" {
     type = string
     default = "t3.micro"
}

variable "ami_id" {
     type = string 
     default = "ami-0bc691261a82b32bc"  # Amazon ubuntu ami in eu-west-1
}