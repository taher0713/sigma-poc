.PHONY: install-docker
install-docker:
	bash ./install-docker.bash


.PHONY: check-env
check-env:
ifndef DOMAIN_NAME
	$(warning env DOMAIN_NAME is undefined)
endif

.PHONY: deploy-chain
deploy-chain: check-env
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	cat ./docker-compose.yaml | envsubst | docker-compose -f - pull
	cat ./docker-compose.yaml | envsubst | docker-compose -f - up -d

.PHONY: deploy-chain-2
deploy-chain-2: check-env
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	cat ./v2/docker-compose.yaml | envsubst | docker-compose -f - pull
	cat ./v2/docker-compose.yaml | envsubst | docker-compose -f - up -d
