PGPASSWORD=postgres dropdb   --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" my_db
PGPASSWORD=postgres dropuser --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" db_user