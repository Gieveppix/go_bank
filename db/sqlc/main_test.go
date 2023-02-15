package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

var dbDriver = "postgres"
var dbSource = "postgresql://root:pass@localhost:5432/go_bank?sslmode=disable"

var testQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Can not conntect to db: ", err)
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
