package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"github.com/lib/pq"
	"io/ioutil"
	"race-history-3/libs"
)

type Championship struct {
	Id       int    `json:"id"`
	Title    string `json:"title"`
	ResultId int    `json:"result_id"`
	RoundIds []int  `json:"round_ids"`
}

type CommonDataItem struct {
	Id    int    `json:"id"`
	Title string `json:"title"`
}

type ResultPointer struct {
	Id          int    `json:"id"`
	ResultId    int    `json:"result_id"`
	Alias       string `json:"alias"`
	Points      int    `json:"points"`
	OrderPoints int    `json:"order_points"`
}

type Mock struct {
	Championships []Championship   `json:"championships"`
	Rounds        []CommonDataItem `json:"rounds"`
	Teams         []CommonDataItem `json:"teams"`
	Drivers       []CommonDataItem `json:"drivers"`
	Results       []CommonDataItem `json:"results"`
	ResultsPoints []ResultPointer  `json:"result_points"`
}

var Conf libs.AppConfig

var items = Mock{}
var clearedTables = []string{
	"teams",
	"drivers",
	"championships",
	"results",
	"rounds",
}

func main() {

	Conf = libs.ReadConfig()

	data, err := ioutil.ReadFile("data-mock/data.json")

	libs.ShowError(err)

	err = json.Unmarshal(data, &items)

	libs.ShowError(err)

	db, err := sql.Open("postgres", Conf.GetDbConnectParams().DSN)

	libs.ShowError(err)

	// 0. Очистим все.
	for _, table := range clearedTables {

		_, err := db.Exec(fmt.Sprintf("TRUNCATE public.%s CASCADE", table))

		libs.ShowError(err)
	}

	// 1. Заливаем results
	loadCommonRows(db, "results", items.Results)

	// 2. Заливаем result_points
	loadResultPoints(db, items.ResultsPoints)

	// 3. Заливаем championships
	loadChampionships(db, items.Championships)

	// 4. Заливаем rounds
	loadCommonRows(db, "rounds", items.Rounds)

	// 5. Заливаем teams
	loadCommonRows(db, "teams", items.Teams)

	// 6. Заливаем drivers
	loadCommonRows(db, "drivers", items.Drivers)
}

func loadCommonRows(db *sql.DB, table string, rows []CommonDataItem) {

	txn, stmt := buildCopyIn(db, pq.CopyIn(table, "id", "title"))

	for _, row := range rows {

		_, err := stmt.Exec(row.Id, row.Title)

		libs.ShowError(err)
	}

	err := stmt.Close()

	libs.ShowError(err)

	err = txn.Commit()

	libs.ShowError(err)
}

func loadChampionships(db *sql.DB, rows []Championship) {

	txn, stmt := buildCopyIn(db, pq.CopyIn("championships", "id", "title", "result_id"))

	for _, row := range rows {

		_, err := stmt.Exec(row.Id, row.Title, row.ResultId)

		libs.ShowError(err)
	}

	err := stmt.Close()

	libs.ShowError(err)

	err = txn.Commit()

	libs.ShowError(err)
}

func loadResultPoints(db *sql.DB, rows []ResultPointer) {

	txn, stmt := buildCopyIn(db,
		pq.CopyIn(
			"result_points",
			"id",
			"result_id",
			"alias",
			"points",
			"order_points"))

	for _, row := range rows {

		_, err := stmt.Exec(row.Id, row.ResultId, row.Alias, row.Points, row.OrderPoints)

		libs.ShowError(err)
	}

	err := stmt.Close()

	libs.ShowError(err)

	err = txn.Commit()

	libs.ShowError(err)
}

func buildCopyIn(db *sql.DB, query string) (*sql.Tx, *sql.Stmt) {

	txn, err := db.Begin()

	libs.ShowError(err)

	stmt, err := txn.Prepare(query)

	libs.ShowError(err)

	return txn, stmt
}
