#
# Cookbook:: docker-service
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.


# find node with private-registry role and add attribute
registry = search(:node, 'role:private-registry').first
node.default['private_registry_ip'] = registry['privateaddress']

# create and start docker service if it is not already installed
docker_service 'default' do
  action [:create, :start]
  not_if { File.exist?("/etc/init.d/docker") }
end

# use template to configure /etc/docker/daemon.json for insecure registry
# and restart docker
template '/etc/docker/daemon.json' do
  variables private_registry_ip: node['private_registry_ip']
  source 'daemon.json.erb'
  owner 'root'
  group 'root'
  mode 00644
  action [:create_if_missing]
  notifies :restart, 'docker_service[default]', :immediately
  not_if 'grep ' + node['private_registry_ip'] + ' /etc/docker/daemon.json'
end

docker_service 'default' do
  action [:nothing]
end
