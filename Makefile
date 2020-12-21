SHELL := /bin/bash

###############
#   Install   #
###############
install:
	symfony composer install
	symfony run yarn encore dev

update:
	symfony composer update
	symfony run yarn install
	symfony run yarn encore dev

##############
#   Docker   #
##############
docker-restart: docker-stop docker-start

docker-start:
	docker-compose up -d

docker-stop:
	docker-compose stop

############
#   test   #
############
test:tests

tests:
	symfony console doctrine:fixtures:load -n
	symfony run bin/phpunit
.PHONY: tests
