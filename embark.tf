/* Source of the embark site: https://github.com/embarklabs/embark-site */

resource "cloudflare_record" "embark" {
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "embark"
  value   = "embarklabs.github.io"
  proxied = true
}
