help:
	@echo -------------------------------------------------
	@echo '|          Makefile help commands              |'
	@echo -------------------------------------------------
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed -e 's/:/   /'

build-image: ## Build the docker images
	docker-compose -f $(PWD)/docker/docker-compose.yml build --no-cache

up: ## Ups all the containers related to this project
	docker-compose -f $(PWD)/docker/docker-compose.yml up -d

stop: ## Stop all the containers
	docker-compose -f $(PWD)/docker/docker-compose.yml stop

ps: ## Show the status of all the containers
	docker-compose -f $(PWD)/docker/docker-compose.yml ps

logs: ## Display the container logs
	docker-compose -f $(PWD)/docker/docker-compose.yml logs -f

compile:
	docker exec -it docker_truffle-app_1 truffle compile

migrate:
	docker exec -it docker_truffle-app_1 truffle migrate --network developmentDocker

test-contracts:
	docker exec -it docker_truffle-app_1 truffle test --network developmentDocker

debug-transaction:
	docker exec -it docker_truffle-app_1 truffle debug $(tx-hash)

truffle-console:
	docker exec -it docker_truffle-app_1 truffle console --network developmentDocker
