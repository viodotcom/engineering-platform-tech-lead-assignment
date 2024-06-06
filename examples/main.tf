module "echo" {
    source = "../"
    foo = 5 // REPLACE-ME
    bar = "hello" // REPLACE-ME
}

provider "aws" {
    region = "us-east-1"
    default_tags {   
        tags = {
            "Team"        = "REPLACE-ME"
            "System-Name" = "REPLACE-ME"
        } 
    }
}

terraform {
    backend "local" {}
}