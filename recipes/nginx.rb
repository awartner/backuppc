#
# Cookbook Name:: backuppc
# Recipe:: nginx
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Aaron Wartner
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

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

include_recipe 'apt'

package 'fcgiwrap'

service 'fcgiwrap' do
  action [:enable, :start]
end

include_recipe 'chef_nginx::default'

nginx_site 'default' do
  action :disable
end

node.default_unless['backuppc']['cgi']['admin_pass'] = random_password

directory node['backuppc']['ConfDir']

# Fix for the htpasswd cookbook
chef_gem 'htauth' do
  compile_time false
end

htpasswd ::File.join(node['backuppc']['ConfDir'], 'htpasswd') do
  user node['backuppc']['cgi']['admin_user']
  password node['backuppc']['cgi']['admin_pass']
end

nginx_site node['backuppc']['cgi']['servername'] do
  template 'backuppc_site.erb'
end
