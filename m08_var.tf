variable "name" {
  type    = string
  
}

variable "region" {
  type    = string
  
}

variable "ava" {
  type    = list(string)
  
}

variable "key" {
  type    = string
  
}

variable "cidr_main" {
  type    = string
  
}

variable "cidr_public" {
  type    = list(string)
  
}

variable "cidr_private" {
  type    = list(string)
  
}

variable "cidr_privatedb" {
  type    = list(string)
  
}

variable "cidr_route" {
  type    = string
  
}

variable "cidr_ipv6" {
  type    = string
  
}

variable "protocol_main" {
  type    = string
  
}

variable "protocol_http" {
  type    = string
  
}

variable "protocol_http1" {
  type    = string
  
}

variable "protocol_ssh" {
  type    = string
  
}

variable "protocol_sql" {
  type    = string
  
}

variable "protocol_icmp" {
  type    = string
  
}

variable "port_http" {
  type    = number
  
}

variable "port_ssh" {
  type    = number
  
}

variable "port_sql" {
  type    = number
  
}

variable "port_zero" {
  type    = number
  
}

variable "ami_amazon_linux" {
  type    = string
  
}

variable "default_instance" {
  type    = string
 
}

variable "private_ip" {
  type    = string
  
}

variable "lb_type" {
  type    = string
  
}

variable "hc_matcher" {
  type    = string
  
}

variable "hc_path" {
  type    = string
  
}

variable "hc_port" {
  type    = string
  
}

variable "admin_role" {
  type    = string
  
}

variable "place_str" {
  type    = string
  
}

variable "asg_min" {
  type    = number
  
}

variable "asg_max" {
  type    = number
  
}

variable "asg_cap" {
  type    = number
  
}

variable "rds_stor" {
  type    = number
  
}

variable "rds_type" {
  type    = string
  
}

variable "rds_engine" {
  type    = string
  
}

variable "rds_engine_ver" {
  type    = string
  
}

variable "rds_class" {
  type    = string
  
}

variable "rds_name" {
  type    = string
  
}

variable "rds_user" {
  type    = string
  
}

variable "rds_pass" {
  type    = string
  
}