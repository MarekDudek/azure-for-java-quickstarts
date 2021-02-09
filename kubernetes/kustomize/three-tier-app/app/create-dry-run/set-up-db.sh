PGPASSWORD="$PASSWORD" createuser --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" db_user
PGPASSWORD="$PASSWORD" psql              -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" -c "
  ALTER USER \"db_user\" WITH PASSWORD 'db_user'
"
PGPASSWORD="$PASSWORD" createdb   --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" --owner=db_user my_db
PGPASSWORD=db_user     psql              -U db_user  -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" -d my_db -c "
  CREATE TABLE some_table (
    id            SERIAL PRIMARY KEY,
    description   TEXT
  )
"