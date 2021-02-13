IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD="$POSTGRES_PASSWORD" dropdb --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  my_db

PGPASSWORD="$POSTGRES_PASSWORD" dropuser --echo \
  --username="$POSTGRES_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  "$CLIENT_USER"