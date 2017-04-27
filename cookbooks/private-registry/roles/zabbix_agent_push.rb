name 'zabbix_agent_push'
description 'Push zabbix agent image to private registry'
run_list 'recipe[private-registry::zabbix-agent-image]'
