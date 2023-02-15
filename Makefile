postgres:
	docker run --name go_bank -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=pass -d postgres:15-alpine

createdb:
	docker exec -it go_bank createdb --username=root --owner=root go_bank
	
dropdb:
	docker exec -it go_bank dropdb go_bank

migrateup:
	migrate --path db/migration -database "postgresql://root:pass@localhost:5432/go_bank?sslmode=disable" -verbose up

migratedown:
	migrate --path db/migration -database "postgresql://root:pass@localhost:5432/go_bank?sslmode=disable" -verbose down

sqlc: 
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc