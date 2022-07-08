# terraform.tfvars
rg_name = "tf_rg"

tags = {
    cost_center = "contoso research"
}

vnets = [
    {
        name = "dev_vnet"
        address = "10.0.0.0/16"
    },
    {
        name = "staging_vnet"
        address = "10.1.0.0/16"
    },
    {
        name = "prod_vnet"
        address = "10.5.0.0/16"
    },
    {
        name = "depend_vnet"
        address = "10.3.0.0/16"
    }
]