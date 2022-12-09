.PHONY: install-docker
install-docker:
	bash ./install-docker.bash

.PHONY: deploy-chain
deploy-chain:
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	docker-compose up -d

.PHONY: deploy-validator
deploy-validator:
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	cp /tmp/.env ./validator/.env
	docker compose -f ./validator/docker-compose.yaml up -d
