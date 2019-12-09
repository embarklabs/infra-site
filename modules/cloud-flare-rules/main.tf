/* Without this record the redirect won't work since traffic won't gor through CF proxy */
resource "cloudflare_record" "redirect" {
  count   = length(var.redirects)
  zone_id = var.redirects[count.index]["zone"]
  name    = var.redirects[count.index]["fqdn"]
  value   = var.redirects[count.index]["dest"]
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "redirect" {
  zone_id  = var.redirects[count.index]["zone"]
  target   = "${var.redirects[count.index]["fqdn"]}${lookup(var.redirects[count.index], "path", "/*")}"
  count    = length(var.redirects)
  priority = count.index

  actions {
    forwarding_url {
      url         = var.redirects[count.index]["url"]
      status_code = lookup(var.redirects[count.index], "code", 302)
    }
  }
}
