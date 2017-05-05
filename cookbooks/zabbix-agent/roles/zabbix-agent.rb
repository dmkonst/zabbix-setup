name 'zabbix-agent'
description 'Setup zabbix agent inside docker container'
run_list 'recipe[docker-service::docker_service]',\
'recipe[zabbix-agent::pull_image]',\
'recipe[zabbix-agent::run_container]'
