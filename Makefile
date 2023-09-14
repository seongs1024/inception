up: cert_exists volumes_mounted
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

clean: prune
	rm -rf srcs/requirements/nginx/cert
	rm -rf srcs/.env
	rm -rf data

volumes:
	@mkdir -p data/mariadb
	@chmod 777 data
	@chmod 777 data/mariadb
	@mkdir -p data/wordpress
	@chmod 777 data/wordpress

volumes_mounted: data/mariadb data/wordpress
	@echo "volumes mounted!"

.PHONY: up down prune cert env clean volumes volumes_mounted cert_exists
