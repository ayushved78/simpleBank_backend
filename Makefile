postgres:
	docker run --name postgres12 -p 127.0.0.1:5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:latest

createdb:
	docker exec -it postgres12 --username=roo --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	 migrate -path db/migration -database "postgresql://root:root@127.0.0.1:5433/simple_bank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://root:root@127.0.0.1:5433/simple_bank?sslmode=disable" -verbose down

sqlc:
	docker run kjconroy/sqlc [command] - generate

.PHONY: postgres createdb dropdb migrateup mogratedown sqlc
