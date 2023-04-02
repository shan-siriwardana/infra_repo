network_name = "demoapp-network"
network_description = "network for the go demo application"
subnets = [
    {
      subnet_name   = "public-subnet-01"
      subnet_ip     = "10.1.0.0/20"
      subnet_region = "us-central1"
      type = "public"
    },
    {
      subnet_name           = "public-subnet-02"
      subnet_ip             = "10.1.16.0/20"
      subnet_region         = "us-central1"
      type = "public"
    },
    {
      subnet_name               = "private-subnet-01"
      subnet_ip                 = "10.1.32.0/20"
      subnet_region             = "us-central1"
      type = "private"
    },
    {
      subnet_name               = "private-subnet-02"
      subnet_ip                 = "10.1.48.0/20"
      subnet_region             = "us-central1"
      type = "private"
    }
]
router = "demoapp-router"
nat = "demoapp-nat"