up: cert_exists
	@docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

down: 
	@docker compose -f ./srcs/docker-compose.yml down

prune: down
	@docker system prune --all --force --volumes

cert: 
	@make -s -C srcs/requirements/tools cert

cert_exists: srcs/requirements/nginx/cert
	@echo "cert exists!"

env: 
	@make -s -C srcs/requirements/tools env

clean:
	rm -rf srcs/requirements/nginx/cert
	rm -rf srcs/.env
	make prune

.PHONY: up down prune cert env clean
