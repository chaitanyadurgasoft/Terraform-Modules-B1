output "instance_id" {
    value = aws_instance.Public_servers.*.id
  
}

output "Private_instance_id" {
    value = aws_instance.Private_servers.*.id
  
}