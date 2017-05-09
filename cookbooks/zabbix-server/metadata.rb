name 'zabbix-server'
maintainer 'Dmytro Konstantynov'
maintainer_email 'dmytro@flugel.it'
license 'All Rights Reserved'
description 'Installs/Configures zabbix-server'
long_description 'Installs/Configures zabbix-server'
version '0.2.3'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'docker', '~> 2.0'
depends 'ipaddr_extensions', '~> 0.3.1'
depends 'docker-service'
