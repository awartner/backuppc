name 'backuppc'
maintainer 'Aaron Wartner'
maintainer_email 'aawartner@gmail.com'
license 'MIT'
description 'Installs and configures BackupPC'
long_description 'Installs and configures BackupPC'
version '1.0.3'

chef_version '>= 13.0' if respond_to?(:chef_version)

issues_url ''
source_url ''

depends 'apt', '~> 6.0'
depends 'htpasswd', '~> 0.3'
depends 'chef_nginx', '~> 6.0'
depends 'openssl', '~> 7.0'
depends 'sudo', '~> 3.0'

supports 'debian', '>= 8.0'
