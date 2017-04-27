#
# Cookbook:: zabbix-server
# Recipe:: docker_service
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# create and start docker service
docker_service 'default' do
  action [:create, :start]
end

# find node with private-registry role and add attribute
registry = search(:node, 'role:private-registry').first
node.default['private_registry_ip'] = registry['privateaddress']

# use template to configure /etc/docker/daemon.json for insecure registry
template '/etc/docker/daemon.json' do
  variables private_registry_ip: node['private_registry_ip']
  source 'daemon.json.erb'
  owner 'root'
  group 'root'
  mode 00644
  action [:create_if_missing]
end

docker_service 'default' do
  action [:restart]
end
