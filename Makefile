migrate:
	docker-compose exec db /bin/bash -c "psql -U postgres < /migration/create_database.sql"
	docker-compose exec api /bin/bash -c "cd /srv/code && vendor/bin/phinx migrate -e development"
api-composer-install:
	docker-compose run --rm composer composer install
frontend-package-install:
	docker-compose run --rm node npm ci
seed:
	docker-compose exec api /bin/bash -c "cd /srv/code && php vendor/bin/phinx seed:run"
frontend-watcher:
	docker-compose run --rm node node scripts/watch.js
