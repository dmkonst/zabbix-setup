#
# Cookbook:: zabbix-server
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

docker_service 'default' do
  action [:create, :start]
end
