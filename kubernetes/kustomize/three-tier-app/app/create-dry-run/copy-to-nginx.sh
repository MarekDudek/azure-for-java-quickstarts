IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD=db_user  psql -U db_user -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" -d my_db \
  --output index.html \
  --html \
  -c "SELECT * FROM some_table"

sleep 60