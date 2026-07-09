# Boilerplate Symfony 7 / PHP 8.2 (Docker)

Boilerplate prêt à cloner pour kata, entretiens techniques, POC rapides.

## Stack

- PHP 8.2-FPM
- Symfony 7 (skeleton) + Doctrine ORM + MakerBundle + PHPUnit
- Caddy (reverse proxy / serveur web)
- MariaDB 10.11

## Démarrage

```bash
git clone <repo> mon-kata
cd mon-kata
just up
```

App disponible sur http://localhost:8080

Nécessite [just](https://github.com/casey/just) installé sur la machine hôte.

## Commandes utiles

```bash
just up                    # démarre les containers
just down                  # arrête les containers
just sh                    # shell dans le container php
just composer require xxx  # composer dans le container
just console make:entity   # bin/console dans le container
just test                  # bin/phpunit
```

## Générer une entité + CRUD rapide

```bash
just console make:entity
just console make:migration
just console doctrine:migrations:migrate
just console make:controller
```

## Config

- `.env` : variables d'environnement (DB déjà configurée pour le container `database`)
- `docker/php/` : Dockerfile + php.ini
- `docker/caddy/Caddyfile` : reverse proxy vers php-fpm:9000

## Créer un nouveau projet à partir de ce boilerplate

```bash
git clone <repo> mon-projet
cd mon-projet
rm -rf .git && git init
```

1. `composer.json` : changer `name` (ex. `moi/mon-projet`)
2. `.env` : regénérer `APP_SECRET` (`openssl rand -hex 16`), adapter `COMPOSE_PROJECT_NAME`
3. `docker-compose.yml` : adapter port `8080` si conflit avec un autre projet
4. `just up` puis `just console about` pour vérifier
