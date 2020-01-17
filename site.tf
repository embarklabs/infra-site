/* Source of the blog: https://github.com/embarklabs/blog */

locals {
  github_pages_ips = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

resource "cloudflare_record" "blog" {
  count   = length(local.github_pages_ips)
  zone_id = local.zones["embarklabs.io"]
  type    = "A"
  name    = "@"
  value   = "embarklabs.github.io"
  proxied = true
}
