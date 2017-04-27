#
# Cookbook:: private-registry
# Recipe:: run_registry_image
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

docker_container 'registry' do
  repo 'registry'
  tag '2'
  port '5000:5000'
  restart_policy 'always'
  action :run_if_missing
end
