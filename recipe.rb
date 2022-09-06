#
# Cookbook Name: acme_sh
# Recipe: default
#

git '/root/acme.sh' do
  repository 'https://github.com/Neilpang/acme.sh.git'
  revision node['acme_sh']['version']
  action :sync
end

bash 'install acme.sh' do
  user 'root'
  environment('HOME' => '/root')
  cwd '/root/acme.sh'
  code './acme.sh --install'

  not_if { node['acme_sh'] && node['acme_sh']['installed_version'] == node['acme_sh']['version'] }
end
