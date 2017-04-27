#
# Cookbook:: private-registry
# Recipe:: zabbix_agent_image
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# pull zabbix-agent image
docker_image 'zabbix/zabbix-agent' do
  repo 'zabbix/zabbix-agent'
  tag 'latest'
  action :pull
end

# tag a zabbix-agent image
docker_tag 'private repo tag for zabbix-agent' do
  target_repo 'zabbix/zabbix-agent'
  target_tag 'latest'
  to_repo node['privateaddress'] + ':5000/zabbix-agent'
  to_tag 'latest'
  action :tag
end

# push zabbix-agent image to private-registry
docker_image node['privateaddress'] + ':5000/zabbix-agent' do
  action :push
end
