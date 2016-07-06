#
# Cookbook Name:: aw-backuppc
# Attributes:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

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
