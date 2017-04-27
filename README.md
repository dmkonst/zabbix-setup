# zabbix-setup

Contains 3 cookbooks for setup zabbix-server and zabbix-agents inside docker containers

zabbix-server cookbook contains role zabbix-server for setup of zabbix server with mysql server DB and zabbix web interface

private-registry cookbook contains 2 roles:
1) private-registry - for setup of private registry for future user
2) zabbix_agent_push - for pulling zabbix-agent image from public registry and pushing it to already configured private registry

zabbix-agent cookbook contains role zabbix-agent which should pull image from configured private registry (made by role private-registry) and setup docker container with zabbix-agent ready for server monitoring (using privileged mode for container)

TODO: 
add recipe in zabbix-server cookbook to create autodiscovery action.
