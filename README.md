# taberu-devenv

## dependencies
 - docker 🐳
 - docker-compose ✍️
 - make
 - git

## setup

```console
    git clone git@github.com:SchramlTim/taberu.git src
    make api-composer-install
    make frontend-package-install
    docker-compose up -d
    make migrate
```