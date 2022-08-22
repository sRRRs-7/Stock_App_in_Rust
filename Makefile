
postgres:
	docker run --name stock_app -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:14-alpine

stopcon:
	docker stop stock_app

delcon:
	docker rm stock_app

createdb:
	docker exec -it stock_app createdb --username=root --owner=root stock_app_db

dropdb:
	docker exec -it axum_server dropdb stock_app_db

addsqlx:
	sqlx migrate add ${name}

runsqlx:
	sqlx migrate run


.PHONY: postgres, delcon, stopcon, createdb, dropdb, createsqlx, runsqlx