#
# Cookbook Name:: backuppc
# Recipe:: server
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

package 'nginx'
package 'backuppc'

sudo 'backuppc_local' do
  user 'backuppc'
  nopasswd true
  commands ['/bin/tar']
end

template ::File.join(node['backuppc']['ConfDir'], 'config.pl') do
  source 'config.pl.erb'
  owner node['backuppc']['user']
  group node['backuppc']['group']
  notifies :reload, 'service[backuppc]', :immediately
end

service 'backuppc' do
  action [:enable, :start]
end
