IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD="$POSTGRES_PASSWORD" createuser --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  "$CLIENT_USER"

PGPASSWORD="$POSTGRES_PASSWORD" psql \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --command="
    ALTER USER \"$CLIENT_USER\" WITH PASSWORD '$CLIENT_PASSWORD'
  "

PGPASSWORD="$POSTGRES_PASSWORD" createdb --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --owner="$CLIENT_USER" \
  my_db

PGPASSWORD="$CLIENT_PASSWORD" psql \
  --username="$CLIENT_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --dbname=my_db \
  --command="
    CREATE TABLE some_table (
      id            SERIAL PRIMARY KEY,
      description   TEXT
    )
  "