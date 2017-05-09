name 'zabbix-agent'
maintainer 'Dmytro Konstantynov'
maintainer_email 'dmytro@flugel.it'
license 'All Rights Reserved'
description 'Installs/Configures zabbix-agent'
long_description 'Installs/Configures zabbix-agent'
version '0.2.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'docker', '~> 2.0'
depends 'docker-service'
