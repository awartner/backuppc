#
# Cookbook Name:: aw-backuppc
# Recipe:: server
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt'

package 'nginx'
package 'backuppc'

template ::File.join(node['backuppc']['ConfDir'], 'config.pl') do
  source 'config.pl.erb'
  owner node['backuppc']['user']
  group node['backuppc']['group']
  notifies :reload, 'service[backuppc]', :immediately
end

service 'backuppc' do
  action :nothing
end

include_recipe 'nginx'

nginx_site node['backuppc']['cgi']['servername'] do
  template 'backuppc.erb'
  notifies :reload, 'service[nginx]', :immediately
end

service 'nginx' do
  action :nothing
end
