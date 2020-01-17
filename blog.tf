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
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "blog"
  value   = "embarklabs.github.io"
  proxied = true
}
