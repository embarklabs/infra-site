/* Source of the blog: https://github.com/embarklabs/blog */

resource "cloudflare_record" "blog" {
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "blog"
  value   = "embarklabs.github.io"
  proxied = true
}
