_default: _list

# docker - up the stack
docker-up:
    docker compose up -d

# docker - down the stack
docker-down:
    docker compose down --remove-orphans

# docker - build the stack
docker-build:
    docker compose build

docker-status:
    docker compose ps

# shell - run in the php container
php-sh:
    docker compose exec php bash

php-composer *args:
    docker compose exec php composer {{args}}

php-console *args:
    docker compose exec php bin/console {{args}}

php-lint *args:
    docker compose exec php ./vendor/bin/php-cs-fixer {{args}}

php-test *args:
    docker compose exec php bin/phpunit {{args}}

_list:
    @just -l

alias du := docker-up
alias dd := docker-down
alias dps := docker-status
alias build := docker-build
alias sh := php-sh
alias comp := php-composer
alias console := php-console
alias cs := php-lint
alias test := php-test
