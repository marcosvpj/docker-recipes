#!/usr/bin/env bash

export TERM=xterm-color
set -x
clear

export DB_HOST=docker_mariadb_1
export DB_USERNAME=root
export DB_PASSWORD=root
export DB_NAME=datadase_name
export API_HOST=api.server.local

docker-compose up --detach

docker exec -i /docker_mariadb_1 /usr/bin/mysql -u root --password=root --execute="DROP SCHEMA IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME"

docker exec -i /docker_php_1 php /var/www/html/run-migrations.php
