name 'aw_backuppc'
maintainer 'Aaron Wartner'
maintainer_email 'aawartner@gmail.com'
license 'MIT'
description 'Installs and configures BackupPC'
long_description 'Installs and configures BackupPC'
version '1.0.1'

depends 'apt', '>= 2.0'
depends 'htpasswd', '~> 0.2'
depends 'nginx', '~> 2.7'
depends 'openssl', '~> 4.4'

supports 'debian', '>= 8.0'
