# Description

This repo manages Embark Labs domains and other site related infrastructure.

# Configuration

In order to use this [Terraform]() setup you will need to provide it with [CloudFlare]() credentials. The simplest way to do that is by creating a `terraform.tfvars` file:
```conf
cloudflare_token = "my_secret_api_token"
cloudflare_email = "some@email.com"
```

# Usage

Before you start using the configuration you have to load Terraform modules, which you can do with:
```
terraform init
```
Then you can apply the setup in this repo using:
```
terraform apply
```
