module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
    pub_sub_1a_cidr = var.pub_sub_1a_cidr
    pub_sub_2b_cidr = var.pub_sub_2b_cidr
    pri_sub_3a_cidr = var.pri_sub_3a_cidr
    pri_sub_4b_cidr = var.pri_sub_4b_cidr
    pri_sub_5a_cidr = var.pri_sub_5a_cidr
    pri_sub_6b_cidr = var.pri_sub_6b_cidr
}

module "nat-gw" {
    source = "./modules/nat-gw"

    vpc_id = module.vpc.vpc_id
    igw_id = module.vpc.igw_id
    pub_sub_1a_id = module.vpc.pub_sub_1a_id
    pub_sub_2b_id = module.vpc.pub_sub_2b_id
    pri_sub_3a_id = module.vpc.pri_sub_3a_id
    pri_sub_4b_id = module.vpc.pri_sub_4b_id
    pri_sub_5a_id = module.vpc.pri_sub_5a_id
    pri_sub_6b_id = module.vpc.pri_sub_6b_id
}

module "alb" {
    source = "./modules/alb"
    project_name = var.project_name
    vpc_id = module.vpc.vpc_id
    pub_sub_1a_id = module.vpc.pub_sub_1a_id
    pub_sub_2b_id = module.vpc.pub_sub_2b_id
    ALB_SG_ID = module.sec-group.ALB_SG_ID
}


module "sec-group" {
    source = "./modules/sec-group"
    vpc_id = module.vpc.vpc_id 
}

module "bastion_host" {
    source = "./modules/bastion-host"
    pub_sub_1a_id = module.vpc.pub_sub_1a_id
    BASTION_SG_ID = module.sec-group.BASTION_SG_ID
    SSH_KEY = module.key.SSH_KEY
}

module "key" {
    source = "./modules/key"
}

module "auto-scal-grp" {
    source = "./modules/auto-scal-grp"
    project_name = var.project_name
    pri_sub_3a_id = module.vpc.pri_sub_3a_id
    pri_sub_4b_id = module.vpc.pri_sub_4b_id
    SSH_KEY = module.key.SSH_KEY
    WEB_SG_ID = module.sec-group.WEB_SG_ID
    tg_arn = module.alb.tg_arn
  
}


module "route-53" {
    source = "./modules/route-53"
    alb_dns_name = module.alb.alb_dns_name
    alb_zone_id = module.alb.alb_zone_id 

  
}

module "rds" {
    source = "./modules/rds"
    db_username = var.db_username
    db_password = var.db_password
    db_sg_id = module.sec-group.DB_SG_ID
    pri_sub_5a_id = module.vpc.pri_sub_5a_id
    pri_sub_6b_id = module.vpc.pri_sub_6b_id
  
}