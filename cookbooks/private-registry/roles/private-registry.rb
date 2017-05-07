name 'private-registry'
description 'Configure private docker registry'
run_list 'recipe[docker-service::docker_service]',\
'recipe[docker-service::private_registry]',\
'recipe[private-registry::pull_registry_image]',\
'recipe[private-registry::run_registry_container]'
