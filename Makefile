migrate:
	#docker-compose exec db /bin/bash -c "psql -U postgres < /migration/create_database.sql"
	docker-compose exec api /bin/bash -c "cd /srv/code && vendor/bin/phinx migrate -e development"
api-composer-install:
	docker-compose run --rm composer composer install
frontend-package-install:
	docker-compose run --rm node npm ci
seed:
	docker-compose exec api /bin/bash -c "cd /srv/code && php vendor/bin/phinx seed:run"
frontend-watcher:
	docker-compose run --rm node node scripts/watch.js
generate-api-spec:
	docker-compose run --rm openapi rm -rf ./generate
	docker-compose run --rm openapi generate -i main.yaml -g openapi-yaml -o generate
	docker-compose run --rm openapi chown -R 1000:1000 ./generate
generate-api-typescript:
	docker-compose run --rm orval rm -rf frontend/lib/
	#docker-compose run --rm orval orval --input api/spec/generate/openapi/openapi.yaml --output frontend/lib/api.ts --client swr
	docker-compose run --rm orval orval --config api/spec/orval.config.js
