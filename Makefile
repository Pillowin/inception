NAME = inception

all: $(NAME)

$(NAME):
#	wget -c https://wordpress.org/latest.tar.gz
#	tar xf latest.tar.gz -C ./srcs/requirements/tools/code/ --strip-components 1
#	rm -rf latest.tar.gz
#	docker volume create --opt type=none --opt device=$(PWD)/srcs/requirements/tools/code --opt o=bind website
	docker-compose --project-directory ./srcs/ -f ./srcs/docker-compose.yml build
	docker-compose --project-name $(NAME) --project-directory ./srcs/ -f ./srcs/docker-compose.yml up -d

clean:
	docker-compose --project-name $(NAME) --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean

re:	clean all

.PHONY:	all clean fclean re
