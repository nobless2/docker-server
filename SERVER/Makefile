u:
	sh scripts/build_nginx_config.sh
	sh scripts/add_hosts.sh
	docker compose up -d

d:
	sh scripts/remove_hosts.sh
	docker compose down

dv:
	sh scripts/remove_hosts.sh
	docker compose down -v

b:
	docker compose build

bc:
	docker compose build --no-cache

clean:
	docker builder prune