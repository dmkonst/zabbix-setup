#
# Cookbook:: zabbix-server
# Recipe:: docker_containers
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

zabbix_db = data_bag_item('zabbix_db', 'zabbix_db')

# run mysql container
docker_container 'mysql-server' do
  sensitive true
  repo 'mysql/mysql-server'
  env [
    'MYSQL_ROOT_PASSWORD=' + zabbix_db['password'],
    'MYSQL_DATABASE=' + zabbix_db['db'],
  ]
  restart_policy 'always'
  action :run_if_missing
end

# grants privileges to 172.17.0.* hosts
# need to have few retries, because mysql server takes some time to start
execute 'mysql-grant-zabbixserver' do
  retries 5
  retry_delay 5
  command 'docker exec mysql-server mysql -u' + zabbix_db['user'] + ' -p' + zabbix_db['password'] + ' ' + zabbix_db['db'] + ' --execute="grant all privileges on ' + zabbix_db['db'] + '.* to root@\'172.17.0.%\' identified by \'' + zabbix_db['password'] + '\'"'
end

# run zabbix-server container
docker_container 'zabbix-server' do
  sensitive true
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
  sensitive true
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

# wait untill zabbix will start successfully
execute 'wait-for-zabbix' do
  retries 5
  retry_delay 5
  command 'docker logs zabbix-server | grep -q "entered RUNNING state"'
end
