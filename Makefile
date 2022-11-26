all: 
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	@sudo rm -rf /home/$USER/data/database/*
	@sudo rm -rf /home/$USER/data/www/*
	@sudo docker system prune -a

re:
	fclean all

.PHONY: all re down clean
