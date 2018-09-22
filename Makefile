app_version=$(shell git rev-parse HEAD 2> /dev/null | sed "s/\(.*\)/\1/")
env=development

compile:
	docker-compose run app go build -o ./dist/main
	chmod +x ./dist/main

deploy: compile
	docker-compose -f docker-compose-ansible.yml run \
	ansible ansible-playbook devops/deploy.yml \
	--connection local -e "APP_VERSION=$(app_version)" \
	-e "ENVIRONMENT=$(env)";