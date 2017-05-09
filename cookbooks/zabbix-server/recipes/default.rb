#
# Cookbook:: zabbix-server
# Recipe:: docker_containers
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

include_recipe 'docker-service::default'
include_recipe 'zabbix-server::pull_images'
include_recipe 'zabbix-server::docker_containers'
