resource "cloudflare_record" "dns_records" {
  zone_id = local.zones["embark.team"]
  type    = "TXT"
  name    = "_ens"
  value   = "a=0x2500d3147595331F833600a04211a62eBdCDfdcb"
  proxied = false
}
