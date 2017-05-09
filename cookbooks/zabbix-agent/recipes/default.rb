#
# Cookbook:: zabbix-server
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# find node with private-registry role and add attribute
registry = search(:node, 'recipes:"private-registry"').first
node.default['private_registry_ip'] = registry['privateaddress']

# find node with zabbix-server role and add attribute
zabbix_server = search(:node, 'recipes:"zabbix-server"').first
node.default['zabbix_server_ip'] = zabbix_server['privateaddress']

include_recipe 'docker-service::private_registry'
include_recipe 'zabbix-agent::pull_image'
include_recipe 'zabbix-agent::run_container'
