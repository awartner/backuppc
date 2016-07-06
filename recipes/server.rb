#
# Cookbook Name:: aw-backuppc
# Recipe:: server
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

include_recipe 'apt'

package 'nginx'
package 'fcgiwrap'
package 'backuppc'

template ::File.join(node['backuppc']['ConfDir'], 'config.pl') do
  source 'config.pl.erb'
  owner node['backuppc']['user']
  group node['backuppc']['group']
  notifies :reload, 'service[backuppc]', :immediately
end

service 'backuppc' do
  action [:enable, :start]
end

service 'fcgiwrap' do
  action [:enable, :start]
end

include_recipe 'nginx'

nginx_site node['backuppc']['cgi']['servername'] do
  template 'backuppc.erb'
  notifies :reload, 'service[nginx]', :immediately
end

service 'nginx' do
  action :nothing
end

node.set_unless['backuppc']['cgi']['admin_pass'] = random_password

htpasswd ::File.join(node['backuppc']['ConfDir'], 'htpasswd') do
  user node['backuppc']['cgi']['admin_user']
  password node['backuppc']['cgi']['admin_pass']
end
