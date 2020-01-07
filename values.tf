locals {
  dns_records = [
    /* ENS entries */
    {
      zone = local.zones["embark.team"],
      type = "TXT",
      name = "_ens",
      dest = "a=0x2500d3147595331F833600a04211a62eBdCDfdcb",
    },
  ]

  dns_redirects = [
    {
      zone = local.zones["embark.team"],
      fqdn = "embark.team",
      dest = "embark.status.im",
      url  = "https://embark.status.im/",
    },
    {
      zone = local.zones["embarklabs.io"],
      fqdn = "embarklabs.io",
      dest = "embark.status.im",
      url  = "https://embark.status.im/",
    },
  ]
}
