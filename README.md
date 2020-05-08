# acme_sh_cookbook

Installs/upgrades the (acme.sh)[https://github.com/acmesh-official/acme.sh] library for issuing certificates via Let's Encrypt automatically.

Include the recipe in your run list, then use a `bash` resource to call acme.sh and issue/install the certificate:

```ruby
bash 'issue letsencrypt cert and reload nginx' do
  user 'root'
  environment({ 'HOME' => '/root' }
  cwd '/root/.acme.sh'
  code <<-BASH
    ./acme.sh --issue -d example.com
    ./acme.sh --install-cert -d example.com \
      --fullchain-file "/path/nginx/expects/example.crt" \
      --key-file "/path/nginx/expects/example.key" \
      --reloadcmd "service nginx force-reload"
  BASH

  not_if { ::Dir.exists?("/root/.acme.sh/example.com") }
end
```
