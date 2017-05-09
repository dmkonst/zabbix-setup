#
# Cookbook:: private-registry
# Recipe:: default
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

include_recipe 'ipaddr_extensions'
include_recipe 'docker-service::default'
include_recipe 'docker-service::private_registry'
include_recipe 'private-registry::pull_registry_image'
include_recipe 'private-registry::run_registry_container'
