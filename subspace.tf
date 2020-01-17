/* Source of the blog: https://github.com/embarklabs/subspace-site */

resource "cloudflare_record" "subspace" {
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "subspace"
  value   = "embarklabs.github.io"
  proxied = true
}
