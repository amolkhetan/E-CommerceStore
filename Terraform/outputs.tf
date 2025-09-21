output "security_group_id" {
     value = aws_security_group.ec2_sg.id
 }

output "aws_instance_id" {
     value = aws_instance.ecom-store-ak.id
 }
 
 output "aws_instance_ip" {
     value = aws_instance.ecom-store-ak.public_ip
 }