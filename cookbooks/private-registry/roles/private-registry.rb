name 'private-registry'
description 'Configure private docker registry'
run_list 'recipe[private-registry::docker_service]',\
'recipe[private-registry::pull_registry_image]',\
'recipe[private-registry::run_registry_container]'
