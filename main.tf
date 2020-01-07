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

/* Redirects -----------------------------------*/

module "redirect" {
  source    = "./modules/cloud-flare-rules"
  redirects = local.dns_redirects
}
