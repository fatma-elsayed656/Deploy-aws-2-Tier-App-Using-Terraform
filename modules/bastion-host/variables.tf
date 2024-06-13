variable "cpu" {
  default = "t2.micro"
}
variable "ami" {
    default = "ami-053b0d53c279acc90"
}

variable BASTION_SG_ID{}
variable "pub_sub_1a_id"{}
variable "SSH_KEY"{}