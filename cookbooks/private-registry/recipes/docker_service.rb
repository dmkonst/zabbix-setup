#
# Cookbook:: private-registry
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

template '/etc/docker/daemon.json' do
  source 'daemon.json.erb'
  owner 'root'
  group 'root'
  mode 00644
  action [:create_if_missing]
end

docker_service 'default' do
  action [:restart]
end
