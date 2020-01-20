/* Source of the site: https://github.com/embarklabs/embark-site */

resource "cloudflare_record" "framework" {
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "framework"
  value   = "embarklabs.github.io"
  proxied = true
}

resource "cloudflare_record" "embark" {
  zone_id = local.zones["embarklabs.io"]
  type    = "CNAME"
  name    = "embark"
  value   = "framework.github.io"
  proxied = true
}

resource "cloudflare_page_rule" "redirect-embark-framework" {
  zone_id  = local.zones["embarklabs.io"]
  target   = "embark.embarklabs.io/*"

  actions {
    forwarding_url {
      url         = "https://framework.embarklabs.io/$1"
      status_code = 302
    }
  }
}
