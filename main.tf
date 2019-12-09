/* DERIVED --------------------------------------*/

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_token
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
