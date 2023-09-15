include .env

u:
	docker-compose up nginx -d

d:
	docker-compose down

b:
	docker-compose build --no-cache

conn:
	docker exec -it php-${PROJECT_NAME} /bin/sh

exec:
	docker exec -it php-${PROJECT_NAME} $(c)

