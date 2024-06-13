variable "project_name" {}
variable "WEB_SG_ID" {}
variable "pri_sub_3a_id" {}
variable "pri_sub_4b_id" {}
variable "SSH_KEY" {}
variable "tg_arn" {}

variable "ami" {
    default = "ami-053b0d53c279acc90"
}
variable "cpu" {
    default = "t2.micro"
}

variable "max_size" {
    default = 4
}
variable "min_size" {
    default = 2
}
variable "desired_cap" {
    default = 3
}
variable "asg_health_check_type" {
    default = "ELB"
}