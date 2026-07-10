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
just install
```

App disponible sur http://localhost:PORT

Le port est attribué automatiquement lors de l'installation (étape du `just install`).

## Just

Nécessite [just](https://github.com/casey/just) installé sur la machine hôte.

Exécuter `just` permet d'afficher la liste des recettes disponibles.

## Config

- `.env` : variables d'environnement (DB déjà configurée pour le container `database`)
- `docker/php/` : Dockerfile + php.ini
- `docker/caddy/Caddyfile` : reverse proxy vers php-fpm:9000

## Créer un nouveau projet à partir de ce boilerplate

```bash
git clone <repo> mon-projet
cd mon-projet
rm -rf .git && git init && just install
```

1. `composer.json` : changer `name` (ex. `moi/mon-projet`)
2. `.env` : regénérer `APP_SECRET` (`openssl rand -hex 16`)
3. `just console about` pour vérifier

Ports HTTP/DB attribués automatiquement (libres, à partir de 8080/3306) au premier `just up`, écrits dans `.env.local` (non versionné).

