#
# Cookbook:: zabbix-server
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

include_recipe 'docker-service::default'
include_recipe 'zabbix-agent::pull_image'
include_recipe 'zabbix-agent::run_container'
