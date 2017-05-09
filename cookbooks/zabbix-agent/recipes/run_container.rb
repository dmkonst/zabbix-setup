#
# Cookbook:: zabbix-server
# Recipe:: run_container
#
# Copyright:: 2017, Dmytro Konstantynov, All Rights Reserved.

# run container with zabbix-agent
docker_container 'zabbix-agent' do
  repo node['private_registry_ip'] + ':5000/zabbix-agent'
  env [
    'ZBX_HOSTNAME=' + node['hostname'],
    'ZBX_SERVER_HOST=' + node['zabbix_server_ip'],
  ]
  privileged true
  port '10050:10050'
  restart_policy 'always'
  action :run_if_missing
end
