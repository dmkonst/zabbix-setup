name 'zabbix-server'
description 'Setup zabbix server with web interface'
run_list 'recipe[docker-service::docker_service]',\
'recipe[zabbix-server::pull_images]',\
'recipe[zabbix-server::docker_containers]'
