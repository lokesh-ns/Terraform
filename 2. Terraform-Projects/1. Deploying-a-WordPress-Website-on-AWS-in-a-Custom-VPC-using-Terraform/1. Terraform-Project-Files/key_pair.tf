# resource "tls_private_key" "rsa-key-pair" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "my-public-key-pair" {
#   key_name   = "my-public-key-pair"
#   public_key = tls_private_key.rsa-key-pair.public_key_openssh
# }

# resource "local_file" "my-private-key-pair" {
#     content     = tls_private_key.rsa-key-pair.private_key_pem
#     filename = "my-private-key"
# }