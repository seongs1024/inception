up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down: 
	@docker-compose -f ./srcs/docker-compose.yml down

prune: down
	@docker system prune -a

cert: 
	@make -s -C srcs/requirements/tools cert

env: 
	@make -s -C srcs/requirements/tools env

.PHONY: up down prune cert env
