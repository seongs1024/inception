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

clean:
	rm -rf srcs/requirements/nginx/cert
	rm -rf srcs/.env
	rm -rf /home/${USER}/data

volume:
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/wordpress

volume_mounted: /home/${USER}/data/mariadb /home/${USER}/data/wordpress
	@echo "volume mounted!"

.PHONY: up down prune cert env clean volumes cert_exists env_sets volume_mounted
