IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD="$POSTGRES_PASSWORD" createuser --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  db_user

PGPASSWORD="$POSTGRES_PASSWORD" psql \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --command="
    ALTER USER \"db_user\" WITH PASSWORD 'db_user'
  "

PGPASSWORD="$POSTGRES_PASSWORD" createdb --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --owner=db_user \
  my_db

PGPASSWORD=db_user psql \
  --username=db_user \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --dbname=my_db \
  --command="
    CREATE TABLE some_table (
      id            SERIAL PRIMARY KEY,
      description   TEXT
    )
  "