#
# Cookbook Name:: backuppc
# Recipe:: server
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt'

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
