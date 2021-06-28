migrate:
	docker-compose exec db /bin/bash -c "psql -U postgres < /migration/create_database.sql"