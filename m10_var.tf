variable "name" {
  type    = string
  default = "khchoi"
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "ava" {
  type    = list(string)
  default = ["a", "c"]
}

variable "key" {
  type    = string
  default = "khchoi2-key"
}

variable "cidr_main" {
  type    = string
  default = "10.0.0.0/16"
}

variable "cidr_public" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "cidr_private" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "cidr_privatedb" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "cidr_route" {
  type    = string
  default = "0.0.0.0/0"
}

variable "cidr_ipv6" {
  type    = string
  default = "::/0"
}

variable "protocol_main" {
  type    = string
  default = "tcp"
}

variable "protocol_http" {
  type    = string
  default = "http"
}

variable "protocol_http1" {
  type    = string
  default = "HTTP"
}

variable "protocol_ssh" {
  type    = string
  default = "ssh"
}

variable "protocol_sql" {
  type    = string
  default = "sql"
}

variable "protocol_icmp" {
  type    = string
  default = "icmp"
}

variable "port_http" {
  type    = number
  default = "80"
}

variable "port_ssh" {
  type    = number
  default = "22"
}

variable "port_sql" {
  type    = number
  default = "3306"
}

variable "port_zero" {
  type    = number
  default = "0"
}

variable "ami_amazon_linux" {
  type    = string
  default = "ami-04e8dfc09b22389ad"
}

variable "default_instance" {
  type    = string
  default = "t2.micro"
}

variable "private_ip" {
  type    = string
  default = "10.0.0.11"
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "hc_matcher" {
  type    = string
  default = "200"
}

variable "hc_path" {
  type    = string
  default = "/health.html"
}

variable "hc_port" {
  type    = string
  default = "traffic-port"
}

variable "admin_role" {
  type    = string
  default = "admin_role"
}

variable "place_str" {
  type    = string
  default = "cluster"
}

variable "asg_min" {
  type    = number
  default = 2
}

variable "asg_max" {
  type    = number
  default = 10
}

variable "asg_cap" {
  type    = number
  default = 2
}

variable "rds_stor" {
  type    = number
  default = 20
}

variable "rds_type" {
  type    = string
  default = "gp2"
}

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_engine_ver" {
  type    = string
  default = "8.0"
}

variable "rds_class" {
  type    = string
  default = "db.t2.micro"
}

variable "rds_name" {
  type    = string
  default = "test"
}

variable "rds_user" {
  type    = string
  default = "admin"
}

variable "rds_pass" {
  type    = string
  default = "dinho2005!"
}