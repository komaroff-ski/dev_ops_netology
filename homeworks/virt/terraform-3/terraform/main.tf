module "vpc" {
  source = "./modules/vpc"
  v4_cidr_blocks = local.v4_cidr_blocks[terraform.workspace]
  network = terraform.workspace
  subnet = "subnet-${terraform.workspace}"
  zone = "ru-central1-a"
}

module "instance"{
  source = "./modules/instance"
  name = "vm-${terraform.workspace}"
  subnet_id = module.vpc.subnet_ids
  cores = local.cores[terraform.workspace]
  memory = local.memory[terraform.workspace]
  instance_count = local.instance_count[terraform.workspace]
  platform = local.platform[terraform.workspace]
  fe_instance = local.fe_instances[terraform.workspace]
  depends_on = [module.vpc]
}

locals {
  v4_cidr_blocks = {
    default = ["192.168.20.0/24"]
    prod = ["192.168.21.0/24"]
    stage = ["192.168.22.0/24"]
  }
 cores = {
    default = 2
    prod = 4
    stage = 2
 }
  memory = {
    default = 2
    prod = 4
    stage = 2
  }
  instance_count = {
    default = 1
    prod = 2
    stage = 1
  }
    platform = {
      default = "standard-v1"
      prod    = "standard-v2"
      stage   = "standard-v1"
    }

    fe_instances = {
      default = {
        fe-web = {
          cores    = 2
          memory   = 2
          platform = "standard-v1"
        }
        fe-db = {
          cores    = 4
          memory   = 4
          platform = "standard-v1"
        }
      }
      prod = {
        fe-web = {
          cores    = 4
          memory   = 4
          platform = "standard-v2"
        }
        fe-db = {
          cores    = 8
          memory   = 8
          platform = "standard-v2"
        }
      }
      stage = {
        fe-web = {
          cores    = 2
          memory   = 2
          platform = "standard-v1"
        }
        fe-db = {
          cores    = 4
          memory   = 4
          platform = "standard-v1"
        }
      }
    }
}