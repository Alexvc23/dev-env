NAME		= my-debian
USER		= $(shell whoami)
VOLUMES		= $(shell docker volume ls -f "name=my-dev-volume" -q)
CONTAINER   = $(shell docker ps -q)

COMPOSE		= docker-compose -f srcs/docker-compose.yml -p $(NAME)


all:		up

up:			build
			$(COMPOSE) up -d

build:		volumes
			$(COMPOSE) build

volumes:
			mkdir -p /Users/alexandervalencia/Documents/programing/Docker/dev-env/data

create:		build
			$(COMPOSE) create


start:
			$(COMPOSE) start

restart:
			$(COMPOSE) restart

ps:
			$(COMPOSE) ps

exec:
ifeq '$(CONTAINER)' ''
	@echo "there are no containers running\n"
else
	docker exec -it $(CONTAINER) /bin/bash
endif

stop:
			$(COMPOSE) stop

down:
			$(COMPOSE) down --rmi all --volumes
			#docker volume rm $(VOLUMES) 
			rm -rf  /Users/alexandervalencia/Documents/programing/Docker/dev-env/data

logs:
			docker-compose -f srcs/docker-compose.yml -p $(NAME) logs

re:			fclean all

.PHONY:		all re up down build create ps exec start restart stop fclean
