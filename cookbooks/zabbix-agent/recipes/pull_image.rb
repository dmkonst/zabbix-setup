#
# Cookbook:: zabbix-server
# Recipe:: pull_image
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# pull zabbix-agent image
docker_image 'zabbix-agent' do
  repo node['private_registry_ip'] + ':5000/zabbix-agent'
  tag 'latest'
  action :pull
end
