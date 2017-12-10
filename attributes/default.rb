cookbook_name = 'backuppc'

default[cookbook_name]['user'] = 'backuppc'
default[cookbook_name]['group'] = 'www-data'
default[cookbook_name]['servername'] = 'localhost'
default[cookbook_name]['TopDir'] = '/var/lib/backuppc'
default[cookbook_name]['ConfDir'] = '/etc/backuppc'
default[cookbook_name]['LogDir'] = '/var/lib/backuppc/log'
default[cookbook_name]['InstallDir'] = '/usr/share/backuppc'
default[cookbook_name]['CgiDir'] = '/usr/share/backuppc/cgi-bin'
default[cookbook_name]['FullPeriod'] = 6.97
default[cookbook_name]['IncrPeriod'] = 0.97
default[cookbook_name]['FullKeepCnt'] = 1
default[cookbook_name]['IncrKeepCnt'] = 6
default[cookbook_name]['SmbClientPath'] = '/usr/bin/smbclient'
default[cookbook_name]['TarClientPath'] = '/bin/tar'
default[cookbook_name]['RsyncClientPath'] = '/usr/bin/rsync'
default[cookbook_name]['NmbLookupPath'] = '/usr/bin/nmblookup'
default[cookbook_name]['PingPath'] = '/bin/ping'

default[cookbook_name]['cgi']['port'] = 80
default[cookbook_name]['cgi']['socket'] = 'unix:/var/run/fcgiwrap.socket'
default[cookbook_name]['cgi']['servername'] = 'localhost'

default[cookbook_name]['htpasswd_path'] = '/usr/bin/htpasswd'
default[cookbook_name]['cgi']['admin_user'] = 'admin'
default[cookbook_name]['cgi']['admin_pass'] = nil

default['authorization']['sudo']['include_sudoers_d'] = true

default['nginx']['default_site_enabled'] = false

default['postfix']['aliases'] = {
  'backuppc' => 'root',
}
