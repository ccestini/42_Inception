
PATH_YML = ./srcs/docker-compose.yml
PATH_VOLUME_DB = ~/data/mariadb
PATH_VOLUME_WP = ~/data/wordpress

all:
	@mkdir -p $(PATH_VOLUME_DB)
	@mkdir -p $(PATH_VOLUME_WP)
	@printf "\033[34m-> starting services <-\033[0m\n"
	@docker-compose -f $(PATH_YML) up -d --build

up: 
	@docker-compose -f $(PATH_YML) up -d

down: 
	@docker-compose -f $(PATH_YML) down

restart: down up

clean:
	@docker-compose -f $(PATH_YML) down -v
	@printf "\033[33m-> cleaning configurations <-\033[0m\n"
	@docker system prune -af

fclean: clean
	@printf "\033[31m-> total cleaning, including volumes <-\033[0m\n"
	@docker network prune --force
	@docker volume prune --force
	@sudo -k rm -rf $(PATH_VOLUME_DB) $(PATH_VOLUME_WP)

.PHONY: all up down restart clean fclean
