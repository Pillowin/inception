NAME = inception

all: $(NAME)

$(NAME):
#	wget -c https://wordpress.org/latest.tar.gz
#	tar xf latest.tar.gz -C ./srcs/requirements/tools/code/ --strip-components 1
#	rm -rf latest.tar.gz
	mkdir -p $(HOME)/website
	mkdir -p $(HOME)/database
#	docker volume create --opt type=none --opt device=$(HOME)/website --opt o=bind website
#	docker volume create --opt type=none --opt device=$(HOME)/database --opt o=bind database
#	wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O /tmp/wordpress.tar.gz
#	tar -xf /tmp/wordpress.tar.gz -C $(HOME)/website --strip-components=1
#	rm -f /tmp/wordpress.tar.gz
#	cp ./srcs/requirements/wordpress/conf/wp-config.php $(HOME)/website/
	docker-compose --file ./srcs/docker-compose.yml build
	docker-compose --file ./srcs/docker-compose.yml up -d

clean:
	docker-compose --project-name $(NAME) --project-directory srcs -f srcs/docker-compose.yml down

fclean:	clean

re:	clean all

.PHONY:	all clean fclean re
