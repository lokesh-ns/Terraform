resource "aws_instance" "bastion" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.public_subnet_1.id
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.my_web_server_security_group.id, aws_security_group.my_ssh_security_group.id ]
    tags = {
        Name: "bastion_instance"
    }

    connection {
        type        = "ssh"
        user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
        private_key = file("C:/Users/HP/Downloads/loki-ohio.pem")  # Replace with the path to your private key
        host        = self.public_ip
    }
    
    provisioner "file" {
        source = "C:/Users/HP/Downloads/loki-ohio.pem"
        destination = "/home/ec2-user/loki-ohio.pem" 
    }

    provisioner "remote-exec" {
        inline = [
            "cd /home/ec2-user/",
            "chmod 400 loki-ohio.pem",
        ]
        on_failure = fail
    }

}

resource "aws_instance" "setup_server" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.private_app_subnet_1.id
    vpc_security_group_ids = [ aws_security_group.my_ALB_security_group.id, aws_security_group.my_ssh_security_group.id, aws_security_group.my_web_server_security_group.id ]
    associate_public_ip_address = false
    tags = {
        Name: "setup_server_instance"
    }
    depends_on = [ aws_efs_file_system.my_efs, aws_db_instance.my_db ]
    user_data = file("setup_server_script.sh")
}