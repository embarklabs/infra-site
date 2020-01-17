locals {
  dns_redirects = [
    {
      zone = local.zones["embark.team"],
      fqdn = "embark.team",
      dest = "embark.status.im",
      url  = "https://embark.status.im/",
    }
  ]
}

module "redirect" {
  source    = "./modules/cloud-flare-rules"
  redirects = local.dns_redirects
}
