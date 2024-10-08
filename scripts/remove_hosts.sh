#!/bin/bash
for project_folder in ../sites/*_project; do
  if [ -f "$project_folder"/.env ]; then
    APP_NAME=$(grep -Eo 'APP_NAME=[^;]+' "$project_folder"/.env | cut -d= -f2-)
        HOST_RECORD="127.0.0.1 $APP_NAME.loc"
        sudo grep -v "$HOST_RECORD" /etc/hosts > temp_hosts
        sudo mv temp_hosts /etc/hosts
  fi
done