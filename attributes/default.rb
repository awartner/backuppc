#
# Cookbook Name:: backuppc
# Attributes:: default
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

default['backuppc']['user'] = 'backuppc'
default['backuppc']['group'] = 'www-data'
default['backuppc']['servername'] = 'localhost'
default['backuppc']['TopDir'] = '/var/lib/backuppc'
default['backuppc']['ConfDir'] = '/etc/backuppc'
default['backuppc']['LogDir'] = '/var/lib/backuppc/log'
default['backuppc']['InstallDir'] = '/usr/share/backuppc'
default['backuppc']['CgiDir'] = '/usr/share/backuppc/cgi-bin'
default['backuppc']['FullPeriod'] = 6.97
default['backuppc']['IncrPeriod'] = 0.97
default['backuppc']['FullKeepCnt'] = 1
default['backuppc']['IncrKeepCnt'] = 6
default['backuppc']['SmbClientPath'] = '/usr/bin/smbclient'
default['backuppc']['TarClientPath'] = '/bin/tar'
default['backuppc']['RsyncClientPath'] = '/usr/bin/rsync'
default['backuppc']['NmbLookupPath'] = '/usr/bin/nmblookup'
default['backuppc']['PingPath'] = '/bin/ping'

default['backuppc']['cgi']['port'] = 80
default['backuppc']['cgi']['socket'] = 'unix:/var/run/fcgiwrap.socket'
default['backuppc']['cgi']['servername'] = 'localhost'

default['backuppc']['htpasswd_path'] = '/usr/bin/htpasswd'
default['backuppc']['cgi']['admin_user'] = 'admin'
default['backuppc']['cgi']['admin_pass'] = nil

default['authorization']['sudo']['include_sudoers_d'] = true

default['nginx']['default_site_enabled'] = false

default['postfix']['aliases'] = {
  'backuppc' => 'root',
}
