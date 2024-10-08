#!/bin/bash
while IFS='=' read -r key value; do
  export "$key"="$value"
done < .env

nginxFile=config/nginx-proxy.conf
indexFile=config/index.html
[ -f $nginxFile ] && rm $nginxFile
[ -f $indexFile ] && rm $indexFile

for project_folder in $PROJECTS_PATH; do
  if [ -f "$project_folder"/.env ]; then
    APP_NAME=$(grep -Eo 'APP_NAME=[^;]+' "$project_folder"/.env | cut -d= -f2-)
    APP_PORT=$(grep -Eo 'APP_PORT=[^;]+' "$project_folder"/.env | cut -d= -f2-)

#    nginx config
        echo "server {" >> $nginxFile
        echo "   listen 80;" >> $nginxFile
        echo "   server_name $APP_NAME.loc;" >> $nginxFile
        echo "   location / {" >> $nginxFile
        echo "       proxy_pass http://host.docker.internal:$APP_PORT;" >> $nginxFile
        echo "       proxy_set_header Host \$host;" >> $nginxFile
        echo "       proxy_set_header X-Real-IP \$remote_addr;" >> $nginxFile
        echo "   }" >> $nginxFile
        echo "}" >> $nginxFile

#        index file
        echo "<h3><a href='http://$APP_NAME.loc'>$APP_NAME</a></h3><br>" >> $indexFile
  fi
done