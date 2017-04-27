#
# Cookbook:: private-registry
# Recipe:: pull_registry_image
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# pull docker registry image
docker_image 'registry' do
  repo 'registry'
  tag '2'
  action :pull
end
