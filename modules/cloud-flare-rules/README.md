# Description

This [Terraform](https://www.terraform.io/docs/index.html) module configures CloudFlare [Page Rules](https://www.cloudflare.com/features-page-rules/).

# Usage

To use this you have to supply 3 variables:

* `redirects` - List of redirects to create.

# Example

Here's an example of how you can configure it:
```terraform
variable redirects {
  default     = [
    {
      zone = "status.im"
      fqdn = "token.status.im"
      dest = "coinmarketcap.com"
      path = "/*"
      url  = "https://coinmarketcap.com/currencies/status/"
    },
    {
      zone = "status.im"
      fqdn = "banana.status.im"
      dest = "wikipedia.org"
      path = "/*"
      url  = "https://en.wikipedia.org/wiki/Banana"
    }
  ]
}
```
And then:
```terraform
module "redirect" {
  source    = "modules/cloud-flare-rules"
  redirects = "${var.redirects}"
}
```
