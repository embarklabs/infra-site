locals {
  dns_records = [
    /* ENS entries */
    {
      zone = var.zones["embark.team"],
      type = "TXT",
      name = "_ens",
      dest = "a=0x2500d3147595331F833600a04211a62eBdCDfdcb",
    },
  ]

  dns_redirects = [
    {
      zone = var.zones["embark.team"],
      fqdn = "embark.team",
      dest = "embark.status.im",
      url  = "https://embark.status.im/",
    },
  ]
}
