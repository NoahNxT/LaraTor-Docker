# Docker for Laravel 8 (PHP 8.0.3) - Basic LEMP STACK

1. clone laravel project in src folder
2. change .env of your laravel project:
    a. DB_HOST=mysql
    b. DB_DATABASE= <! Name you chose in .env in the main directory !>
    c. DB_PASSWORD= <! Root password you chose in .env in the main directory !>
3. In the main dir do `source aliases.sh`. This will give you  the needed commands
4. Do `dinit` -> enter (This does the whole installation of your laravel project like composer install, etc...)
5. Do `donion` -> This prints your .onion adress in the terminal.
6. Done!
updated main docker-compose.yml to fit x64 needs
docker-compose.yml.arm is for ARM architecture use when on RPI etc (just rename)
