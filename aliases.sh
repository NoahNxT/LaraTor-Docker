#!/bin/bash

IN_DOCKER_PATH="/var/www/php"

PHP_CONTAINER=php

alias dinit='docker exec PHP bash -c "composer install ; npm install ; php artisan migrate:fresh --seed ; php artisan key:generate"'
alias dartisan=artisan
alias dcomposer=composer
alias dnode=node
alias donion='docker exec -ti Tor onions'

composer() {
    docker-compose exec $PHP_CONTAINER composer $@
}

artisan() {
    docker-compose exec $PHP_CONTAINER php $IN_DOCKER_PATH//artisan $@
}

node() {
    docker-compose exec $PHP_CONTAINER yarn $@
}

echo "Available commands: dinit, dcomposer, dartisan, dnode, donion"
