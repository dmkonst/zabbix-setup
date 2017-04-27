#
# Cookbook:: zabbix-server
# Recipe:: mysql_grant
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

zabbix_db = data_bag_item('zabbix_db', 'zabbix_db')

# grants privileges to 172.17.0.* hosts
execute 'mysql-grant-zabbixserver' do
  command 'sleep 5; docker exec mysql-server mysql -u' + zabbix_db['user'] + ' -p' + zabbix_db['password'] + ' ' + zabbix_db['db'] + ' --execute="grant all privileges on ' + zabbix_db['db'] + '.* to root@\'172.17.0.%\' identified by \'' + zabbix_db['password'] + '\'"'
end
