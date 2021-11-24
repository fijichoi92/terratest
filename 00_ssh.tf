resource "aws_key_pair" "khchoi_key" {
  key_name =  "khchoi2_key" 
#public_key =  
  public_key = file("../../.ssh/khchoi-key.pub")
}
