IFS=$'\n\t'
set -euxo pipefail

for _ in {1..60}
do
  PGPASSWORD=db_user  psql -U db_user -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" -d my_db -c "
    INSERT INTO some_table (description) VALUES (md5(random()::text))
  "
  sleep 1
done