name 'aw-backuppc'
maintainer 'Aaron Wartner'
maintainer_email 'aawartner@gmail.com'
license 'MIT'
description 'Installs and configures BackupPC'
long_description 'Installs and configures BackupPC'
version '0.1.0'

depends 'apt'
depends 'htpasswd', '~> 0.2.4'
depends 'nginx', '~> 2.7.6'
depends 'openssl', '~> 4.4.0'

supports 'debian', '>= 8.0'
