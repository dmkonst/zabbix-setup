#
# Cookbook:: zabbix-server
# Recipe:: pull_images
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# pull mysql docker image
docker_image 'mysql/mysql-server' do
  repo 'mysql/mysql-server'
  tag 'latest'
  action :pull
end

# pull zabbix-server image
docker_image 'zabbix/zabbix-server-mysql' do
  repo 'zabbix/zabbix-server-mysql'
  tag 'latest'
  action :pull
end

# pull zabbix-web image
docker_image 'zabbix/zabbix-web-nginx-mysql' do
  repo 'zabbix/zabbix-web-nginx-mysql'
  tag 'latest'
  action :pull
end
