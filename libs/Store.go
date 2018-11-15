package libs

func DbConnect(params DbConnectParams) string {

	return params.DSN
}

type DbConnectParams struct {
	DSN string
}
