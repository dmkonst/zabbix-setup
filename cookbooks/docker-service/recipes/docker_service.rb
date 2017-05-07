#
# Cookbook:: docker-service
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# create and start docker service if it is not already installed
docker_service 'default' do
  action [:create, :start]
  not_if { File.exist?("/etc/init.d/docker") }
end
