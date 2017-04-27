#
# Cookbook:: zabbix-server
# Recipe:: mysql_grant
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# grants privileges to 172.17.0.* hosts
execute 'mysql-grant-zabbixserver' do
  command 'sleep 10; docker exec mysql-server \
  mysql -uroot -prgCHcYuXGcqkfR zabbix \
  --execute="grant all privileges on zabbix.* to root@\'172.17.0.%\' \
  identified by \'rgCHcYuXGcqkfR\'"'
end
