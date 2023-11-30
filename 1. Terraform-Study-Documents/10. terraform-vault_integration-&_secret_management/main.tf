provider "aws" {
  region = "us-east-2"
}

provider "vault" {
  address = "http://18.116.164.243:8200/"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "b53592c3-080c-0374-d97f-4ff612fb8725"
      secret_id = "835a3d50-9f56-d16d-176a-6852a84eddcd"
    }
  }
}

data "vault_kv_secret_v2" "vault_example" {
  mount = "loki-kv"
  name  = "loki-secret"
}

resource "aws_instance" "my_instance" {
  ami = "ami-0e83be366243f524a"
  instance_type = "t2.micro"
  tags = {
    Name = data.vault_kv_secret_v2.vault_example.data["username"]
  }
}