variable "region" {}

variable "project_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
    description = "VPC cidr block variable"
}

variable "pub_sub_1a_cidr" {
    type = string
    description = "First Public subnet cidr block"
}

variable "pub_sub_2b_cidr" {
    type = string
    description = "Second Public subnet cidr block"
}

variable "pri_sub_3a_cidr" {
    type = string
    description = " First Web private subnet cidr block"
}

variable "pri_sub_4b_cidr" {
    type = string
    description = "Second Web private subnet cidr block"
}

variable "pri_sub_5a_cidr" {
    type = string
    description = "Primary DB private subnet cidr block"
}

variable "pri_sub_6b_cidr" {
    type = string
    description = "Secondary DB private subnet cidr block"
}


variable db_username {}
variable db_password {}