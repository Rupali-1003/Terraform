# outputs for count

#output "ec2_instance_public_ip" {
#     value = aws_instance.my_ec2_instance[*].public_ip
#}

#output "ec2_instance_private_ip" {
#     value = aws_instance.my_ec2_instance[*].private_ip
#}

#output "ec2_instance_public_dns" {
#        value = aws_instance.my_ec2_instance[*].public_dns
#}

# outputs for for_each
output "ec2_instance_public_ip" {
     value = [for instance in aws_instance.my_ec2_instance : instance.public_ip]
}
output "ec2_instance_public_dns" {
     value = [for instance in aws_instance.my_ec2_instance : instance.public_dns]
}
output "ec2_instance_private_ip" {
     value = [for instance in aws_instance.my_ec2_instance : instance.private_ip]
}