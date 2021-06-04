NAME = inception

all: $(NAME)

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean

re: $(NAME)

.PHONY:	all clean fclean re
