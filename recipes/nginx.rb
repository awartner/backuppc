#
# Cookbook Name:: backuppc
# Recipe:: nginx
#
# The MIT License (MIT)
#
# Copyright (c) 2017 Aaron Wartner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

include_recipe 'apt'

package 'fcgiwrap'

service 'fcgiwrap' do
  action [:enable, :start]
end

include_recipe 'chef_nginx::default'

directory node[cookbook_name]['ConfDir']

# Fix for the htpasswd cookbook
chef_gem 'htauth' do
  compile_time false
end

%w(admin_pass certificate certificate_key).each do |attr|
  if node[cookbook_name]['cgi'][attr].nil?
    raise "Set node['#{cookbook_name}']['cgi']['#{attr}']"
  end
end

htpasswd ::File.join(node[cookbook_name]['ConfDir'], 'htpasswd') do
  user node[cookbook_name]['cgi']['admin_user']
  password node[cookbook_name]['cgi']['admin_pass']
end

if node[cookbook_name]['cgi']['certificate_key'].nil?
  raise "Set node['#{cookbook_name}']['cgi']['certificate_key']"
end

nginx_site node[cookbook_name]['cgi']['servername'] do
  template 'backuppc_site.erb'
  variables(
    http_port: node[cookbook_name]['cgi']['http_port'],
    https_port: node[cookbook_name]['cgi']['https_port'],
    servername: node[cookbook_name]['cgi']['servername'],
    access_log: ::File.join(node['nginx']['log_dir'], 'backuppc.access.log'),
    error_log: ::File.join(node['nginx']['log_dir'], 'backuppc.error.log'),
    htpasswd: ::File.join(node[cookbook_name]['ConfDir'], 'htpasswd'),
    cgi_bin: ::File.join(node[cookbook_name]['InstallDir'], 'cgi-bin'),
    fastcgi_params: ::File.join(node['nginx']['dir'], 'fastcgi_params'),
    fastcgi_socket: node[cookbook_name]['cgi']['socket'],
    certificate: node[cookbook_name]['cgi']['certificate'],
    certificate_key: node[cookbook_name]['cgi']['certificate_key']
  )
end
