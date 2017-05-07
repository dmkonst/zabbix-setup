name 'private-registry'
maintainer 'Dmytro Konstantynov'
maintainer_email 'dmytro@flugel.it'
license 'All Rights Reserved'
description 'Installs/Configures private-registry'
long_description 'Installs/Configures private-registry'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'docker', '~> 2.0'
depends 'ipaddr_extensions', '~> 0.3.1'
