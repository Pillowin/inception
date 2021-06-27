NAME = inception

all: $(NAME)

$(NAME):
	@mkdir -p /home/agautier/data/website
	@mkdir -p /home/agautier/data/database
	docker-compose --file ./srcs/docker-compose.yml up -d
	@echo -n "Waiting for wordpress initialization"
	@bash ./srcs/requirements/tools/check_install.sh
	@echo "\nReady !"

clean:
	docker-compose --file srcs/docker-compose.yml down

fclean:	clean
	sudo rm -Rf /home/agautier/data/*
	docker system prune --all --volumes
	docker volume rm -f inception_website
	docker volume rm -f inception_database
	@echo ""
	docker ps
	@echo ""
	docker volume ls
	@echo ""
	docker network ls

re:	fclean 
	@mkdir -p /home/agautier/data/website
	@mkdir -p /home/agautier/data/database
	docker-compose --file ./srcs/docker-compose.yml build
	docker-compose --file ./srcs/docker-compose.yml up -d
	@echo -n "Waiting for wordpress initialization"
	@bash ./srcs/requirements/tools/check_install.sh
	@echo "\nReady !"

.PHONY:	all clean fclean re
