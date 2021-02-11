IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD="$PASSWORD" dropdb   --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" my_db
PGPASSWORD="$PASSWORD" dropuser --echo -U postgres -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" db_user