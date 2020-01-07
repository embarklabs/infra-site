locals {
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
