module "vpc" {
    source = "./networking"
    providers = {
        aws = aws.NVirgi
    }

}

module "servers"{
    source = "./servers"
    providers = {
        aws = aws.NVirgi
    }
    subnet_id = module.vpc.tp-snet01a-id 
}