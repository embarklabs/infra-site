/* Source of the blog: https://github.com/embarklabs/subspace-site */

resource "cloudflare_record" "subspace" {
  count   = length(local.github_pages_ips)
  zone_id = local.zones["embarklabs.io"]
  type    = "A"
  name    = "subspace"
  value   = local.github_pages_ips[count.index]
  proxied = true
}
