# Welcome to LaraTor!

LaraTor is a LEMP stack for **Laravel 8 ** projects with with **PHP 8.0.3** that needs to be hosted on the Tor Network. By using a reverse proxy of **Tor's Hidden Network Service** it allows you to allow Tor traffic to access your site and it gives you your **.onion** address. 

If you like the image or/and idea, be sure to star the repo and watch it if you want to be updated with all the new upcoming features.

[LaraTor Repo](https://github.com/NoahNxT/LaraTor-Docker)
[Follow Me!](https://github.com/NoahNxT)

# Docker Compose
*V3-version*
```
version: '3.7'

# Services
services:

  # Tor Service
  tor:
    container_name: Tor
    image: goldy/tor-hidden-service:0.3.5.8
    restart: always
    links:
      - nginx
    environment:
        # Set mapping ports
        SERVICE1_TOR_SERVICE_HOSTS: 80:nginx:80
        
  # Nginx Service
  nginx:
    image: nginx:latest
    container_name: Nginx
    ports:
      - 86:80
      - 469:443
    restart: always
    volumes:
      - ./src:/var/www/php:ro
      - ./.docker/nginx/conf.d:/etc/nginx/conf.d:ro
    depends_on:
      - php

  # PHP Service
  php:
    container_name: PHP
    build: ./.docker/php
    working_dir: /var/www/php
    restart: always
    volumes:
      - ./src:/var/www/php
    depends_on:
      - mysql

  # MySQL Service
  mysql:
    container_name: MySQL
    image: mysql:latest
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: "${MYSQL_ROOT_PASSWORD}"
      MYSQL_DATABASE: "${MYSQL_DATABASE}"
    volumes:
      - ./.docker/mysql/my.cnf:/etc/mysql/conf.d/my.cnf:ro
      - .docker/mysql/mysqldata:/var/lib/mysql

  #Redis Service
  redis:
    image: "redis:alpine"
    container_name: Redis
    restart: always
    ports:
      - "6379:6379"



```
    

## Create folders

You'll have to create a folder named ***src*** in the directory of your docker-compose.yml. The **src** directory will be the directory where you can clone your laravel project.

## .ENV's

 1. `cp .env.example .env` create your .env file out of the example
	 a. `COMPOSE_PROJECT_NAME` is the name of your stack
	 b. `DB_DATABASE` is the name of your database
	 c. `MYSQL_ROOT_PASSWORD` is your root password
2. in the **src** folder where you've cloned your project, change these values:
	a. `DB_HOST=mysql`  
	b. `DB_DATABASE= <! Name you chose in .env in the main directory !>`  
	c. `DB_PASSWORD= <! Root password you chose in .env in the main directory !>`  
	
## Aliases

I've created an **aliases.sh** file that allows you to easily execute commands in your containers. You can use the script by sourcing the file.

    source aliases.sh

***Commands:***

 1. `dinit`
	 a. This command initializes your whole project. See it as an auto setup of your project.

> composer install 
> npm install 
> php artisan migrate:fresh --seed 
> php artisan key:generate

2. `dcomposer <command>`
	a. Replace <command> by the composer command you want to execute in the container.
	
    **Example**
``
    dcomposer update
``

3. `dartisan <command>`
	a. Replace `<command>` by the artisan command you want to execute in the container.
	
    **Example**
``
    dartisan clear:cache
``

4. `dnode <command>`
	a. Replace `<command>` by the npm command you want to execute in the container.
	
    **Example**
``
    dnode install your/package
``

5. `donion`
	a.Returns your **.onion** address of your website.

## Delete directory mysqldata

If you change any values in the **.env's** be sure that you remove the folder `mysqldata` in `.docker/mysql`


##  Disclaimer
This image is for educational purposes. Do not use it with bad intentions. I'm not responsible for any consequences you get by using this image with bad intentions.
