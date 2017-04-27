#
# Cookbook:: zabbix-server
# Recipe:: docker_containers
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

zabbix_db = data_bag_item('zabbix_db', 'zabbix_db')

# run mysql container
docker_container 'mysql-server' do
  repo 'mysql/mysql-server'
  env [
    'MYSQL_ROOT_PASSWORD=' + zabbix_db['password'],
    'MYSQL_DATABASE=' + zabbix_db['db'],
  ]
  restart_policy 'always'
  action :run_if_missing
end

# run zabbix-server container
docker_container 'zabbix-server' do
  repo 'zabbix/zabbix-server-mysql'
  env [
    'MYSQL_USER=' + zabbix_db['user'],
    'MYSQL_PASSWORD=' + zabbix_db['password'],
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
    'MYSQL_USER=' + zabbix_db['user'],
    'MYSQL_PASSWORD=' + zabbix_db['password'],
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
