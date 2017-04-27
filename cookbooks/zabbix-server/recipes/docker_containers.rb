#
# Cookbook:: zabbix-server
# Recipe:: docker_containers
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.
# db_info = data_bag_item('mysql', 'zabbix_db')

# run mysql container
docker_container 'mysql-server' do
  repo 'mysql/mysql-server'
  env [
    'MYSQL_ROOT_PASSWORD=rgCHcYuXGcqkfR',
    'MYSQL_DATABASE=zabbix',
  ]
  restart_policy 'always'
  action :run_if_missing
end

# run zabbix-server container
docker_container 'zabbix-server' do
  repo 'zabbix/zabbix-server-mysql'
  env [
    'MYSQL_USER=root',
    'MYSQL_PASSWORD=rgCHcYuXGcqkfR',
    'DB_SERVER_HOST=mysql-server',
  ]
  links ['mysql-server:mysql']
  port '10051:10051'
  restart_policy 'always'
  action :run_if_missing
end

# run zabbix-web container
docker_container 'zabbix-web' do
  repo 'zabbix/zabbix-web-nginx-mysql'
  env [
    'MYSQL_USER=root',
    'MYSQL_PASSWORD=rgCHcYuXGcqkfR',
    'ZBX_SERVER_HOST=zabbix-server',
    'DB_SERVER_HOST=mysql-server',
  ]
  links [
    'zabbix-server:zabbix-server',
    'mysql-server:mysql',
  ]
  port '80:80'
  restart_policy 'always'
  action :run_if_missing
end
