#
# Cookbook:: private-registry
# Recipe:: zabbix-agent
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

include_recipe 'private-registry::default'
include_recipe 'private-registry::zabbix-agent-image'
