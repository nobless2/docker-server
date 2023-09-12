# simple docker server

## Run project
docker-compose up nginx -d
#
### Build node
docker-compose run --rm node npm install

docker-compose run --rm node npm run build