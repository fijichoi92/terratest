resource "aws_key_pair" "khchoi_key" {
  key_name =  "khchoi2_key" 
#public_key =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnFK5uAE8zEtXNE4xl1LM992ZAEDv/U6IlJ4MaVXe0o3llI46KdD2CwE077HoykDBGmY+icHyDL6uXbWs0Y8BCyMsUFHYGqLRl88w3p18tFTVStKNINAlVOtxTjycF+QEeOYPXRPr51SI4YTP1sSY8Xa+yY0u4cqVfX+SI3tpfO1Lb+H7YVDf2am7IxMhwc6K2zXcOtB5FG7YBIfAHZOIKB7hLjAhNth6pl+s7kNVKnbRnbV+UFbQCnTTOAGLN4wtbQS04yXrt8aFDJgUliqPk6T68m1ms/DcN6cowkDaHX/ABDFM4ZrfKsUnGKi8+jehl9RKgj+XKsm2FDeKzMEmxnAifUFdyK+s0CJQlKVnSpILwOuEH11d7nfjiqI5V70bO3xeVUbzVxvHoS6Gss8z9Sde8X/jAHID0DSn4FwTrQmw9JcMfLifGvdXal52bZ3oK9I6YvCFSFqz4Dcbb/pXqqnZwK0hDd3sjD2kujkm0R35GEaQ2XReX7qLtPZX7cOU="
  public_key = file("../../.ssh/khchoi-key.pub")
}