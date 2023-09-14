up: cert_exists env_sets volume_mounted
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

env_sets: srcs/.env
	@echo ".env sets!"

clean: prune
	rm -rf srcs/requirements/nginx/cert
	rm -rf srcs/.env
	rm -rf data

volume:
	@mkdir -p data/mariadb
	@mkdir -p data/wordpress

volume_mounted: data/mariadb data/wordpress
	@echo "volume mounted!"

.PHONY: up down prune cert env clean volumes cert_exists env_sets volume_mounted
