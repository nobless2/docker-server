include .env

u:
	docker-compose up nginx -d

d:
	docker-compose down

dv:
	docker-compose down -v

b:
	docker-compose build --no-cache

clean:
	docker builder prune

conn:
	docker exec -it php-${PROJECT_NAME} /bin/sh

exec:
	docker exec -it php-${PROJECT_NAME} $(c)

