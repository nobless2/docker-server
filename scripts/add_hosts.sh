#!/bin/bash
for project_folder in ../sites/*_project; do
  if [ -f "$project_folder"/.env ]; then
    APP_NAME=$(grep -Eo 'APP_NAME=[^;]+' "$project_folder"/.env | cut -d= -f2-)
        HOST_RECORD="127.0.0.1 $APP_NAME.loc"
        if ! sudo grep -q "$APP_NAME.loc" /etc/hosts; then
          echo "$HOST_RECORD" | sudo tee -a /etc/hosts
        fi
  fi
done