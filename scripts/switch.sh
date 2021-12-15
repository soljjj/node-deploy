#!/bin/bash

echo "> Get Current Profile"
CURRENT_PROFILE=$(curl -s http://localhost/profile)

if [ $CURRENT_PROFILE == set1 ]
then
  IDLE_PORT=8081
elif [ $CURRENT_PROFILE == set2 ]
then
  IDLE_PORT=8080
else
  IDLE_PORT=8080
fi

echo "> Switch Port to $IDLE_PORT"
echo "set \$service_url http://localhost:${IDLE_PORT};" | sudo tee /etc/nginx/conf.d/service-url.inc

echo "> Nginx Reload"
sudo systemctl reload nginx