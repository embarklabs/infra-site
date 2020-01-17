/* Source of the blog: https://github.com/embarklabs/blog */

locals {
  github_pages_ips = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "cloudflare_record" "main" {
  count   = length(local.github_pages_ips)
  zone_id = local.zones["embarklabs.io"]
  type    = "A"
  name    = "@"
  value   = local.github_pages_ips[count.index]
  proxied = true
}

/* Force HTTPS */
resource "cloudflare_page_rule" "main_site_force_ssl" {
  zone_id  = local.zones["embarklabs.io"]
  target   = "embarklabs.io/*"

  actions {
    always_use_https = true
  }
}
