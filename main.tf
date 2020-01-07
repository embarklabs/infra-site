/* DERIVED --------------------------------------*/

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
}

/* CF Zones ------------------------------------*/

/* CloudFlare Zone IDs required for records */
data "cloudflare_zones" "active" {
  filter { status = "active" }
}

/* For easier access to zone ID by domain name */
locals {
  zones = {
    for zone in data.cloudflare_zones.active.zones:
      zone.name => zone.id
  }
}

/* DNS Records ---------------------------------*/

resource "cloudflare_record" "dns_records" {
  count   = length(local.dns_records)
  zone_id = lookup(local.dns_records[count.index], "zone")
  value   = lookup(local.dns_records[count.index], "dest")
  type    = lookup(local.dns_records[count.index], "type", "CNAME")
  name    = lookup(local.dns_records[count.index], "name", "@")
  proxied = lookup(local.dns_records[count.index], "prox", false)
}

/* Redirects -----------------------------------*/

module "redirect" {
  source    = "./modules/cloud-flare-rules"
  redirects = local.dns_redirects
}
