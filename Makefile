DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml
DOCKER_COMPOSE_CMD=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: up

up:
	mkdir -p /home/nhaas/data/db
	mkdir -p /home/nhaas/data/wp
	$(DOCKER_COMPOSE_CMD) up -d --build

down:
	$(DOCKER_COMPOSE_CMD) down

clean:
	$(DOCKER_COMPOSE_CMD) down -v

start:
	$(DOCKER_COMPOSE_CMD) start
stop:
	$(DOCKER_COMPOSE_CMD) stop
fclean: clean
	sudo rm -rf /home/nhaas/data/db
	sudo rm -rf /home/nhaas/data/wp

system_clean: down
	sudo $(RM) -r /home/nhaas/data/
	docker builder prune -a
	docker system prune -a

nginx_log:
	docker container exec -it nginx cat /var/log/nginx/access.log
	docker container exec -it nginx cat /var/log/nginx/error.log

wordpress_log:
	docker container exec -it wordpress cat /
	docker container exec -it wordpress cat /
re: down up
